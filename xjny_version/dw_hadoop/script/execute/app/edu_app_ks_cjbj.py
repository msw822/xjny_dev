#!/usr/bin/env python
# -*- coding:utf-8-*-
#===============================================================================
#
#         FILE: edu_app_ks_cjbj.py
#
#        USAGE: ./edu_app_ks_cjbj.py
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
#    SRC_TABLE:gdm_kc_kccj_xq
#    TGT_TABLE: edu_app_ks_cjbj
#===============================================================================
import sys
import os
import datetime

sys.path.append(os.path.dirname(os.path.dirname(os.getcwd())))
from funcs.GetKeyByTime import getXNandXQByStr12

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
xn,xqm=getXNandXQByStr12(data_day_str)
data_newest_str="2999-12-31"
print(xn,xqm)

sql = """
set mapred.output.compress=true; 
set hive.exec.compress.output=true; 
set mapred.output.compression.codec=org.apache.hadoop.io.compress.SnappyCodec; 
set mapred.output.compression.type=block;

DROP TABLE IF EXISTS  tmp.tmp_ks_grcj;
CREATE TABLE tmp.tmp_ks_grcj
AS 
SELECT xn, xqm_mc, szbh, xh, sum(xf_hd * kccj_jg) / sum(xf_hd) AS pjcj
  FROM (SELECT xn, xqm_mc, szbh, xh, xf_hd, kccj_jg
          FROM gdm.gdm_kc_kccj_xq
         WHERE xn = '"""+xn+"""'
           AND xqm = '"""+xqm+"""' AND xh  like '22%') tmp
 GROUP BY xn, xqm_mc, szbh, xh

;

INSERT OVERWRITE TABLE app.edu_app_ks_cjbj PARTITION(xn='"""+xn+"""',xqm='"""+xqm+"""')
SELECT xh, xqm_mc, grcj.pjcj, bjcj.bjpjcj
  FROM (SELECT * FROM tmp.tmp_ks_grcj) grcj
  LEFT OUTER JOIN (SELECT szbh, sum(pjcj) / count(1) AS bjpjcj
                     FROM (SELECT * FROM tmp.tmp_ks_grcj) grcj
                    GROUP BY szbh) bjcj
    ON grcj.szbh = bjcj.szbh
;
"""
hiveShell = """su hdfs -c \"hive -e \\\"""" + sql + """\\\"\""""
print(hiveShell)
os.system(hiveShell)

