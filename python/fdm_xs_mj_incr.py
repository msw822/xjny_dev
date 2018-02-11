# -*-coding:utf-8-*-
import datetime
import os
import sys

#获取外部日期参数，如果传参则data_day_str为传递的参数，如果未传参data_day_str为昨天的日期
if(len(sys.argv)>1):
    data_day_str = sys.argv[1]
    yesterday = str(sys.argv[1])
    if len(yesterday) == 8:
        data_day_str = yesterday[0:4]+'-'+yesterday[4:6]+'-'+yesterday[6:8]
else:
    today=datetime.date.today()
    oneday=datetime.timedelta(days=1)
    yesterday=today-oneday
    print 'yesterday:',yesterday
    data_day_str=str(yesterday)
    if len(data_day_str) == 8:
        data_day_str = yesterday[0:4]+'-'+yesterday[4:6]+'-'+yesterday[6:8]

###########################################################
# 运行的时候将分区字段替换成  dt = '"""+data_day_str+"""' #
###########################################################

sql = """
set mapred.output.compress=true; 
set hive.exec.compress.output=true; 
set mapred.output.compression.codec=org.apache.hadoop.io.compress.SnappyCodec; 
set mapred.output.compression.type=block;

INSERT OVERWRITE TABLE fdm.fdm_bks_mj PARTITION (dt = '"""+data_day_str+"""') 
SELECT
   a.num,
   b.xm,
   NULL,
   b.bh,
   a.inoutdate,
   NULL,
   (case when a.direction=='入' or a.direction=='无入'  or a.direction=='反入' then '1' else '2' end),
   NULL,
   NULL,a.dt FROM (
      SELECT
        num,
        inoutdate,
        direction,
        dt
      FROM ods.ods_usr_gxsj_t_xscrxx WHERE dt = '"""+data_day_str+"""'
   ) a
LEFT JOIN (SELECT xh, xm,bh FROM ods.ods_usr_gxsj_t_bzks) b ON a.num = b.xh;


"""
#hiveShell = 'hive -e "' + sql + '"'
hiveShell = """su hdfs -c \"hive -e \\\"""" + sql + """\\\"\""""
print(hiveShell)
os.system(hiveShell)
print('finish--')
