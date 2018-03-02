#!/usr/bin/env python
# -*- coding:utf-8-*-
#===============================================================================
#
#         FILE: gdm_ky_zl_da.py
#
#        USAGE: ./gdm_ky_zl_da.py
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
#    SRC_TABLE: fdm_ky_zlcg
#    TGT_TABLE: gdm_ky_zl_da
#===============================================================================
import sys
import os
import datetime

if (len(sys.argv) > 1):
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
sql = """
set mapred.output.compress=true; 
set hive.exec.compress.output=true; 
set mapred.output.compression.codec=org.apache.hadoop.io.compress.SnappyCodec; 
set mapred.output.compression.type=block;
INSERT OVERWRITE TABLE gdm.gdm_ky_zl_da PARTITION (dt = '""" + data_day_str + """')
SELECT
	zl.ZLCGBH,
	zl.ZLCGMC,
	zl.DWH AS DWH_ZL,
	dw.DWMC AS DWMC_ZL,
	zl.SQRQ,
    zl.ZLLXM,
	zllx.MC AS ZLLXM_MC,
	zl.PZRQ,
	zl.FMRS,
	zl.ZLQR,
	ry.XM,
	ry.JSM,
	js.MC AS JSM_MC,
	ry.DWH AS DWH_RY,
    ry.DWMC AS DWMC_RY
FROM
	(SELECT ZLCGBH,ZLCGMC,DWH,SQRQ,ZLLXM,PZRQ,FMRS,ZLQR FROM fdm.fdm_ky_zlcg WHERE dt='""" + data_day_str + """') zl
LEFT OUTER JOIN (select /*+ mapjoin(zllx)*/ * from dim.hb_zllx) zllx ON zl.ZLLXM = zllx.DM
LEFT OUTER JOIN (SELECT KYBH,XM,JSM,DWH,DWMC FROM fdm.fdm_ky_zl_ry WHERE dt='""" + data_day_str + """') ry ON zl.ZLCGBH = ry.KYBH
LEFT OUTER JOIN (select /*+ mapjoin(js)*/ * from dim.hb_js) js ON ry.JSM = js.DM
LEFT OUTER JOIN (select /*+ mapjoin(dw)*/ * from dim.dim_dw) dw ON zl.DWH=dw.DWH
;
"""
hiveShell = """su hdfs -c \"hive -e \\\"""" + sql + """\\\"\""""
print(hiveShell)
os.system(hiveShell)
