#!/usr/bin/env python
# -*- coding:utf-8-*-
#===============================================================================
#
#         FILE: edu_app_yssl_ssmj.py
#
#        USAGE: ./edu_app_yssl_ssmj.py
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
#    SRC_TABLE:fdm_xs_mj_log,
#    TGT_TABLE: edu_app_yssl_ssmj
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

INSERT OVERWRITE TABLE app.edu_app_mj_zjhd PARTITION (dt='"""+data_day_str+"""')
SELECT jbxx.xh,
       jbxx.xm,
       jbxx.ssyxm as yxdm,
       jbxx.ssyxm_mc as yxmc,
       jbxx.zym as zydm,
       jbxx.zym_mc as zymc,
       jbxx.szbh as bjdm,
       jbxx.bjmc as bjmc,
       jbxx.sznj as xznj,
       jbxx.SSFJH as ssdm,
       NULL as ssmc,
       CASE
         WHEN act = '2' THEN
          mj.SKSJ
       END as jss_sj,
       CASE
         WHEN act = '1' THEN
          mj.SKSJ
       END as css_sj
  from (SELECT xh, xm, ssyxm, ssyxm_mc, zym, zym_mc, szbh, bjmc, sznj
          FROM gdm.gdm_xs_jbxx_da
         WHERE dt = '"""+data_newest_str+"""') jbxx
  LEFT JOIN (select xh, max(SKSJ) as zhjssj
               from fdm.fdm_xs_mj_log
              WHERE dt = '"""+data_day_str+"""'
              group by xh) mj
    on js.xh = mj.xh
;
"""
hiveShell = """su hdfs -c \"hive -e \\\"""" + sql + """\\\"\""""
print(hiveShell)
os.system(hiveShell)