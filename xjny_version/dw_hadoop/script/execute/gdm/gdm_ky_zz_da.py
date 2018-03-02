#!/usr/bin/env python
# -*- coding:utf-8-*-
#===============================================================================
#
#         FILE: gdm_ky_zz_da.py
#
#        USAGE: ./gdm_ky_zz_da.py
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
#    SRC_TABLE: fdm_ky_zz
#    TGT_TABLE: gdm_ky_zz_da
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
INSERT OVERWRITE TABLE gdm.gdm_ky_zz_da PARTITION (dt='""" + data_day_str + """')
SELECT
	zz.ZZBH,
	zz.ZZZWMC,
	zz.ZZYWMC,
	zz.DWH,
	dw.DWMC,
	zz.XKLYM,
	NULL AS XKLYM_MC,
	zz.XMLYM,
	xmly.MC AS XMLYM_MC,
	zz.LZLBM,
	lzlb.MC AS LZLBM_MC,
	zz.ZGYZM,
	NULL AS ZGYZM_MC,
	zz.YZM,
	NULL AS YZM_MC,
	zz.CBS,
	zz.CBSJBM,
	cbsjb.MC AS CBSJBM_MC,
	zz.CBRQ,
	zz.CBH,
	zz.ZZZS,
	zz.SSXMBH,
	zz.ISBNH,
	zz.YJXK,
	zz.XXSM,
	ry.XM,
    ry.ZC,
    ry.DWH AS DWH_RY,
    ry.DWMC AS DWMC_RY,
    ry.GZL,
    ry.JSM,
    js.MC AS JSM_MC,
    ry.RYLXM,
    ry.RYLXMC
FROM (select ZZBH,ZZZWMC,ZZYWMC,ZGYZM,DWH,XKLYM,XMLYM,LZLBM,YZM,CBS,CBSJBM,CBRQ,CBH,ZZZS,SSXMBH,ISBNH,YJXK,XXSM from fdm.fdm_ky_zz where dt = '""" + data_day_str + """') zz
LEFT OUTER JOIN (select /*+ mapjoin(dw)*/ * from dim.dim_dw) dw ON zz.DWH = dw.DWH
LEFT OUTER JOIN (select /*+ mapjoin(xmly)*/ * from dim.hb_xmly) xmly ON zz.XMLYM = xmly.DM
LEFT OUTER JOIN (select /*+ mapjoin(lzlb)*/ * from dim.hb_lzlb) lzlb ON zz.LZLBM = lzlb.DM
LEFT OUTER JOIN (select /*+ mapjoin(cbsjb)*/ * from dim.hb_cbsjb) cbsjb ON zz.CBSJBM = cbsjb.DM
LEFT OUTER JOIN (select XM,ZC,DWMC,GZL,JSM,RYLXM,RYLXMC,DWH,KYBH from fdm.fdm_ky_zz_ry where dt = '""" + data_day_str + """') ry ON zz.ZZBH=ry.KYBH
LEFT OUTER JOIN (select /*+ mapjoin(js)*/ * from dim.hb_js) js ON ry.JSM=js.DM;
"""
hiveShell = """su hdfs -c \"hive -e \\\"""" + sql + """\\\"\""""
print(hiveShell)
os.system(hiveShell)
