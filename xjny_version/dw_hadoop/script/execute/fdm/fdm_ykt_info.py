# -*-coding:utf-8-*-

import os
import sys
import datetime

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

data_day_str='2999-12-31'
###########################################################
# 运行的时候将分区字段替换成  dt = '"""+data_day_str+"""' #
###########################################################

sql = """
SET mapred.output.compress = true;
SET hive.exec.compress.output = true;
SET mapred.output.compression.codec = org.apache.hadoop.io.compress.SnappyCodec;
SET mapred.output.compression.type = block;

--  DESCRIPTION: ods->fdm 一卡通账户信息表(fdm_ykt_xx)
INSERT OVERWRITE TABLE fdm.fdm_ykt_xx PARTITION ( dt = '"""+data_day_str+"""' ) 
SELECT
kh,
NULL,
NULL,
NULL,
NULL,
xm,
NULL,
sfrzh,
NULL,
NULL,
NULL,
zhye,
NULL,
NULL,
NULL,
NULL,
NULL,
NULL,
NULL,
NULL,
NULL,
NULL,
NULL,
sfrzh,
NULL,
xh,
NULL,
zcrq,
NULL,
NULL,
NULL,
NULL,
NULL,
kpzt 
FROM
ods.ods_usr_gxsj_t_ykt_kh WHERE dt = '"""+data_day_str+"""';

--  DESCRIPTION: ods->fdm 一卡通商户信息表(fdm_ykt_shxx)
INSERT OVERWRITE TABLE fdm.fdm_ykt_shxx PARTITION (dt = '"""+data_day_str+"""') 
SELECT
A.shid,
A.shmc,
NULL,
NULL,
NULL,
NULL,
NULL,
NULL 
FROM

(SELECT shid,MAX(shmc) AS shmc FROM
ods.ods_usr_gxsj_t_ykt_shxx  WHERE dt = '"""+data_day_str+"""' group by shid) A
;

"""
#hiveShell = 'hive -e "' + sql + '"'
hiveShell = """su hdfs -c \"hive -e \\\"""" + sql + """\\\"\""""
print(hiveShell)
os.system(hiveShell)
print('finish--')