#!/usr/bin/env python
# -*- coding:utf-8-*-
#===============================================================================
#
#         FILE: gdm_sw_log.py
#
#        USAGE: ./gdm_sw_log.py
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
#      CREATED: 2018/02/11
#     REVIEWER:
#     REVISION: ---
#    SRC_TABLE: fdm_sw_log
#    TGT_TABLE: gdm_sw_log
#===============================================================================
import sys
import os
import datetime

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
data_newest_str="2999-12-31"
sql = """
set mapred.output.compress=true; 
set hive.exec.compress.output=true; 
set mapred.output.compression.codec=org.apache.hadoop.io.compress.SnappyCodec; 
set mapred.output.compression.type=block;
INSERT OVERWRITE TABLE gdm.gdm_sw_log PARTITION(dt = '""" + data_day_str + """')
SELECT /*+ mapjoin(bjxx,bzkzy,xb,dw,pycc)*/
 jbxx.xh,
 jbxx.xm,
 jbxx.xbm,
 xb.mc AS xbm_mc,
 xjxx.rxny,
 bjxx.ssnj AS sznj,
 xjxx.szbh,
 bjxx.bjmc,
 COALESCE(xjxx.ZYM, bjxx.SSZYM) AS ZYM,
 COALESCE(bzkzy.mc, bjxx.SSZYMC) AS ZYM_MC,
 COALESCE(xjxx.SSXYM, bjxx.SSYXM) AS SSYXM,
 dw.dwmc AS SSYXM_MC,
 xjxx.pyccm,
 pycc.mc AS pycc_mc,
 jbxx.sfzjh,
 jbxx.csrq,
 swxx.login_time,
 swxx.logout_time,
 swxx.time_long

  FROM (SELECT * FROM fdm.fdm_sw_log WHERE dt = '""" + data_day_str + """') swxx
  LEFT JOIN (SELECT *
               FROM fdm.fdm_xs_jbxx
              WHERE dt = '""" + data_newest_str + """') jbxx
    ON swxx.xh = jbxx.xh
  LEFT JOIN (SELECT *
               FROM fdm.fdm_xs_xjxx
              WHERE dt = '""" + data_newest_str + """') xjxx
    ON jbxx.xh = xjxx.xh
  LEFT JOIN (select * from dim.dim_bjxx) bjxx
    ON xjxx.szbh = bjxx.bh
  LEFT JOIN (select * from dim.hb_bzkzy) bzkzy
    ON bzkzy.DM = xjxx.zym
  LEFT JOIN (select * from dim.hb_xb) xb
    ON xb.DM = jbxx.xbm
  LEFT JOIN (select * from dim.dim_dw) dw
    ON dw.dwh = xjxx.SSXYM
  LEFT JOIN (select * from dim.hb_pycc) pycc
    ON xjxx.pyccm = pycc.dm
"""
hiveShell = """su hdfs -c \"hive -e \\\"""" + sql + """\\\"\""""
print(hiveShell)
os.system(hiveShell)

