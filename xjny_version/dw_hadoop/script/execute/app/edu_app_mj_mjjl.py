# -*- coding:utf-8-*-
#===============================================================================
#
#         FILE: edu_app_mj_mjjl.py
#
#        USAGE: ./edu_app_mj_mjjl.py
#
#  DESCRIPTION: 传入dt参数
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: li.zhanlei@h3c.com
#      COMPANY: bigdata.h3c.com
#      VERSION: 1.0
#      CREATED: 2018/02/26
#     REVIEWER:
#     REVISION: ---
#    SRC_TABLE:fdm_xs_mj_log
#    TGT_TABLE: edu_app_mj_mjjl
#===============================================================================
import sys
import os
import datetime

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
sql = """
set mapred.output.compress=true; 
set hive.exec.compress.output=true; 
set mapred.output.compression.codec=org.apache.hadoop.io.compress.SnappyCodec; 
set mapred.output.compression.type=block;

INSERT OVERWRITE TABLE app.edu_app_mj_mjjl PARTITION (dt='"""+data_day_str+"""')
SELECT XH, SKSJ, NULL, ACT
  FROM fdm.fdm_xs_mj_log
 WHERE dt = '"""+data_day_str+"""'   and  xh like '22%'
 ;
"""
hiveShell = """su hdfs -c \"hive -e \\\"""" + sql + """\\\"\""""
print(hiveShell)
os.system(hiveShell)