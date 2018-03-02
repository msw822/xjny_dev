# -*-coding:utf-8-*-
import os
import sys

if len(sys.argv) > 1:
    data_day_str = sys.argv[1]
    yesterday = str(sys.argv[1])
    if len(yesterday) == 8:
        data_day_str = yesterday[0:4] + '-' + yesterday[4:6] + '-' + yesterday[6:8]
else:
    today = datetime.date.today()
    oneday = datetime.timedelta(days=1)
    yesterday = today - oneday
    print 'yesterday:', yesterday
    data_day_str = str(yesterday)
    if len(data_day_str) == 8:
        data_day_str = yesterday[0:4] + '-' + yesterday[4:6] + '-' + yesterday[6:8]
# -- XH
# 1    总上网时长SW_ZSC，2    日均上网时SW_RJSC，3    集中时间段SW_JZSD ，4    全校上网排名SW_ZSCPM, 5    专业内上网总时长击败百分比SW_ZSCJBB
sql = """
set mapred.output.compress=true; 
set hive.exec.compress.output=true; 
set mapred.output.compression.codec=org.apache.hadoop.io.compress.SnappyCodec; 
set mapred.output.compression.type=block;
INSERT OVERWRITE TABLE adm.edu_adm_swsj PARTITION (dt='""" + data_day_str + """')
SELECT  swgk.XH,  swgk.SW_ZSC, swgk.SW_RJSC, JZSD.SW_JZSD, swgk.SW_ZSCPM, swgk.SW_ZSCJBB FROM 
(
 select c.xh, c.swzsc AS SW_ZSC, c.rjswsc AS SW_RJSC, C.SW_ZSCPM, ROUND((100 - 100*c.swzscpm/d.rs), 2) as sw_zscjbb
 from 
 (  
  select a.xh, a.zym, a.swzsc, a.rjswsc, row_number() over(partition by zym order by swzsc desc) as swzscpm, row_number() over(order by swzsc desc) as SW_ZSCPM
  from 
  ( select xh, zym, coalesce(sum(time_long), 0) as swzsc, 
           sum(time_long)/((to_unix_timestamp(max(logout_time))-to_unix_timestamp(min(login_time)))/86400) as rjswsc
      from (select * from gdm.edu_gdm_swxx where dt='""" + data_day_str + """') aa
      where xh is not null
      group by xh, zym
  ) a  
 ) c
  left join (
   select zym, count(distinct xh) as rs
   from (select * from gdm.edu_gdm_swxx where dt='""" + data_day_str + """') dd
   group by zym
  )d 
 on c.zym=d.zym
) swgk
LEFT JOIN 
  (   SELECT SDB.xh, SDB.SEG SW_JZSD FROM 
        (SELECT XH,MAX(ZSC)AS MAX_SC FROM
                (SELECT xh, SUM(sc)AS zsc , SEG FROM 
                  (select * from tmp.edu_tmp_sw where dt='""" + data_day_str + """') a
                group by xh,SEG
                )SDB
                GROUP BY XH
            )SDB1
     LEFT JOIN
      (
       SELECT xh, SUM(sc)AS zsc , SEG FROM 
       (select * from tmp.edu_tmp_sw where dt='""" + data_day_str + """') a
       group by xh,SEG
      )SDB 
         ON SDB.XH=SDB1.XH AND SDB.ZSC=SDB1.MAX_SC
  )JZSD
ON SWGK.XH=JZSD.XH;
"""
hiveShell = 'hive -e "' + sql + '"'
print('su hdfs -c '+"'"+ hiveShell+"'")
os.system('su hdfs -c '+"'"+ hiveShell+"'")
print('finish--')
