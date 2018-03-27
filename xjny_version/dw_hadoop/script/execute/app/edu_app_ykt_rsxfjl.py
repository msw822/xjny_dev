#!/usr/bin/env python
# -*- coding:utf-8-*-
#===============================================================================
#
#         FILE: edu_app_ykt_rsxfjl.py
#
#        USAGE: ./edu_app_ykt_rsxfjl.py
#
#  DESCRIPTION:热水消费记录表
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: wangyu@h3c.com
#      COMPANY: bigdata.h3c.com
#      VERSION: 1.0
#      CREATED: 2018/03/20
#     REVIEWER: wangyu
#     REVISION: ---
#    SRC_TABLE:
#    TGT_TABLE: edu_app_ykt_rsxfjl
#===============================================================================
import sys
import os
import datetime

sys.path.append(os.path.dirname(os.path.dirname(os.getcwd())))
#from funcs.GetKeyByTime import getXNandXQByStr12

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

INSERT OVERWRITE TABLE app.edu_app_ykt_rsxfjl PARTITION(dt='"""+data_day_str+"""')
select xh    as sfrzm,
       '学生'   as sflx,
	   xm       as xm,
	   xbm_mc   as xb,
	   jysj     as rsxfsj,
	   jydd     as rsxfdd,
	   null     as ysl,
	   null     as yssc,
	   jyje     as xfje 
from gdm.gdm_ykt_jy_log
where 
dt = '"""+data_day_str+"""'  and
shlbmc in ('热水消费') 
and jylx in ('消费');
"""
hiveShell = """su hdfs -c \"hive -e \\\"""" + sql + """\\\"\""""
print(hiveShell)
os.system(hiveShell)

