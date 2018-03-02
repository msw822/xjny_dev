#!/usr/bin/env python
# -*- coding:utf-8-*-
#===============================================================================
#
#         FILE: edu_app_ts_jyjl.py
#
#        USAGE: ./edu_app_ts_jyjl.py
#
#  DESCRIPTION:
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
#    SRC_TABLE:GDM_XS_JBXX_DA
#    TGT_TABLE: edu_app_xs_jbxx
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
data_newest_str="2999-12-31"
sql = """
set mapred.output.compress=true; 
set hive.exec.compress.output=true; 
set mapred.output.compression.codec=org.apache.hadoop.io.compress.SnappyCodec; 
set mapred.output.compression.type=block;

INSERT OVERWRITE TABLE app.edu_app_xs_jbxx PARTITION (dt='"""+data_newest_str+"""')
SELECT XH, 
    XM,
    XBM_MC,
    MZM_MC,
    ZYZJM_MC,
    GJDQM_MC,
    JGM_SM,
    JGM_MC,
    JGM_MC,
    NULL,
    CSRQ,
    SFZJH,
    NULL,
    ZZMM,
    RXNY,
    XSDQZTM_MC,
    XSLBM_MC,
    NULL,
    SSYXM,
    SSYXM_MC,
    ZYM,
    ZYM_MC,
    SZBH,
    BJMC,
    SSFJH,
    NULL,
    SZNJ,
    XZ,
    RXQXLM_MC,
    GJDQM_MC,
    SYDM_SM,
    SYDM_MC,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
FROM GDM.GDM_XS_JBXX_DA WHERE dt='"""+data_newest_str+"""'
"""
hiveShell = """su hdfs -c \"hive -e \\\"""" + sql + """\\\"\""""
print(hiveShell)
os.system(hiveShell)