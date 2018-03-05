#!/usr/bin/env python
# -*- coding:utf-8-*-
#===============================================================================
#
#         FILE: edu_app_kc_kcap.py
#
#        USAGE: ./edu_app_kc_kcap.py
#
#  DESCRIPTION: 传入dt参数，转化为学期，按照学期计算
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
#    SRC_TABLE:fdm_jw_pkap
#    TGT_TABLE: edu_app_kc_kcap
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
INSERT OVERWRITE TABLE app.edu_app_kc_kcap PARTITION(xn = '"""+xn+"""', xqm= '"""+xqm+"""')
SELECT xn as KKXN,
       xq.mc KKXQ,
       JXBH as KCH,
       kcjb.KCMC aS KCMC,
       coalesce(kcap.KCSXM_MC, kcsx.MC) as KCLX,
       kcjb.XF,
       kcjb.ZXS as XS
  FROM (SELECT JXBH, KCDM, KCKSDWH, XF, ZXS, KCSXM, KCSXM_MC,XQM,xn
          FROM fdm.fdm_jw_pkap
         WHERE xn = '"""+xn+"""'
           AND xqm = '"""+xqm+"""') kcap
  LEFT OUTER JOIN (SELECT KCH, KCMC, XF, ZXS
                     FROM fdm.fdm_kc_jbxx
                    WHERE dt = '"""+data_newest_str+"""') kcjb
    ON kcap.KCDM = kcjb.KCH
  LEFT OUTER JOIN (select /*+ mapjoin(kcsx)*/
                    *
                     from dim.hb_kcsx) kcsx
    ON kcap.KCSXM = kcsx.DM
  LEFT OUTER JOIN (select /*+ mapjoin(xq)*/
                    *
                     from dim.hb_xq) xq
    ON kcap.XQM = xq.DM;
"""
hiveShell = """su hdfs -c \"hive -e \\\"""" + sql + """\\\"\""""
print(hiveShell)
os.system(hiveShell)
