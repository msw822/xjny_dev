# -*-coding:utf-8-*-
# 图书借阅数据
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
sql = """
set mapred.output.compress=true; 
set hive.exec.compress.output=true; 
set mapred.output.compression.codec=org.apache.hadoop.io.compress.SnappyCodec; 
set mapred.output.compression.type=block;
INSERT OVERWRITE TABLE adm.edu_adm_tsjyjl_data PARTITION (dt='""" + data_day_str + """')
SELECT a.xh, a.tslb_mc, ROUND(cnt/jyl,2) AS jybl FROM 
 (
  SELECT xh, tslb_mc, COUNT(*) AS cnt FROM
   (select * from gdm.edu_gdm_ts_jyjl_da where dt = '"""+data_day_str+"""')aa GROUP BY xh, TSLB_MC 
 )a
LEFT JOIN 
 (
  SELECT xh, COUNT(DISTINCT TSTM)AS jyl from
   (select * from gdm.edu_gdm_ts_jyjl_da where dt = '"""+data_day_str+"""')bb GROUP BY XH
 )b
ON a.xh=b.xh
ORDER BY xh
"""
hiveShell = 'hive -e "' + sql + '"'
print('su hdfs -c '+"'"+ hiveShell+"'")
os.system('su hdfs -c '+"'"+ hiveShell+"'")
print('finish--')
