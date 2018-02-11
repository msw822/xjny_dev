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

INSERT OVERWRITE TABLE fdm.fdm_ykt_jy PARTITION (dt = '"""+data_day_str+"""') 
SELECT
a.kh,
NULL,
b.xh,
NULL,
A.XFJE,
NULL,
A.XFRQ,
a.xfrqsj,
C.SHMC,
c.shid,
c.shmc,
a.xfsbbh,
NULL,
a.xfye 
FROM
( SELECT kh,xfje,xfrq,xfrqsj,xfsbbh,xfye,xfdwid FROM ods.ods_usr_gxsj_t_ykt_xfjl  WHERE dt = '"""+data_day_str+"""' ) A
LEFT JOIN ( SELECT kh,xh FROM ods.ods_usr_gxsj_t_ykt_KH WHERE dt = '2999-12-31' ) ) B ON A.KH = B.kh
LEFT JOIN ( SELECT shmc,shid,xfsbid,xfdwid FROM ods.ods_usr_gxsj_t_ykt_xfsbbh WHERE dt = '2999-12-31') c ON (
CAST ( CAST ( C.xfsbid AS int ) AS string )) = a.xfsbbh 
AND (
CAST ( CAST ( c.xfdwid AS int ) AS string )) = a.xfdwid;


"""
#hiveShell = 'hive -e "' + sql + '"'
hiveShell = """su hdfs -c \"hive -e \\\"""" + sql + """\\\"\""""
print(hiveShell)
os.system(hiveShell)
print('finish--')
