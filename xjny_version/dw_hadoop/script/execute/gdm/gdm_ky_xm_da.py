#!/usr/bin/env python
# -*- coding:utf-8-*-
#===============================================================================
#
#         FILE: gdm_ky_xm_da.py
#
#        USAGE: ./gdm_ky_xm_da.py
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
#    SRC_TABLE:
#    TGT_TABLE: gdm_ky_xm_da
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
INSERT OVERWRITE TABLE gdm.gdm_ky_xm_da PARTITION (dt = '"""+data_day_str+"""')
SELECT 
xm.XMBH,
xm.DWH,
dw.DWMC,
xm.XMMC,
xm.ZXBH,
xm.KSRQ,
xm.JXRQ,
xm.XMFZRH,
xm.XMWTDWM,
xm.XMWTDWMC,
xm.XMLYM,
xmly.MC AS XMLYM_MC,
xm.MJM,
mj.MC AS MJM_MC,
xm.SHJJXYM,
shjjxy.MC SHJJXYM_MC,
xm.XKLYM,
NULL AS XKLYM_MC,
xm.GJDQM,
NULL AS GJDQM_MC,
xm.JHWCQKM,
jhwcqk.MC AS JHWCQKM_MC,
xm.HZXSM,
HZXS.MC AS HZXSM_MC,
xm.SSJSLY,
xm.XMPZH,
xm.XMLBM,
xmlb.MC AS XMLBM_MC,
xm.XMJBM,
NULL AS XMJBM_MC,
xm.HDLXM,
hdlx.MC AS HDLXM_MC,
xm.XMZXZTM,
zxzt.MC AS ZMZXZTM_MC,
xm.XMJTXS,
xm.SBRQ,
xm.LXRQ,
xm.ZGBM,
xm.XKMLKJM,
xkml.MC AS XKMLKJM_MC,
xm.SSHYM,
NULL AS SSHYM_MC,
xm.DWJSM,
js.MC AS DWJSM_MC,
xm.SBXMH,
xm.YQYJCGJXS,
xm.XMZY,
xm.XDWH,
xm.KTRQ,
xm.SHJJMB,
xm.ZTC,
xm.SSZKT,
xm.XMLYDW,
xm.JBM,
jb.MC AS JBM_MC,
xmjf.JHJFZE,
xmjf.XMJFLYM,
xmjfly.MC AS XMJFLYM_MC,
xmjf.BRRQ,
xmjf.BKS,
xmjf.ZCRQ,
xmjf.BFXZDWJF,
xmjf.BKDW
FROM 
(SELECT XMBH,DWH,XMMC,ZXBH,KSRQ,JXRQ,XMFZRH,XMWTDWM,XMWTDWMC,XMLYM,MJM,SHJJXYM,XKLYM,GJDQM,JHWCQKM,HZXSM,
SSJSLY,XMPZH,XMLBM,XMJBM,HDLXM,XMZXZTM,XMJTXS,SBRQ,LXRQ,ZGBM,XKMLKJM,SSHYM,DWJSM,SBXMH,YQYJCGJXS,XMZY,
XDWH,KTRQ,SHJJMB,ZTC,SSZKT,XMLYDW,JBM 
FROM fdm.fdm_ky_xm WHERE dt='"""+data_day_str+"""') xm
LEFT OUTER JOIN (select /*+ mapjoin(dw)*/ * from dim.dim_dw) dw
ON xm.DWH=dw.DWH
LEFT OUTER JOIN (select /*+ mapjoin(xmly)*/ * from dim.hb_xmly) xmly
ON xm.XMLYM=xmly.DM
LEFT OUTER JOIN (select /*+ mapjoin(mj)*/ * from dim.hb_bmdj) mj
ON xm.MJM=mj.DM
LEFT OUTER JOIN (select /*+ mapjoin(shjjxy)*/ * from dim.hb_shjjxy) shjjxy
ON xm.SHJJXYM=shjjxy.DM
LEFT OUTER JOIN (select /*+ mapjoin(jhwcqk)*/ * from dim.hb_jhwcqk) jhwcqk
ON xm.JHWCQKM=jhwcqk.DM
LEFT OUTER jOIN (select /*+ mapjoin(hzxs)*/ * from dim.hb_hzxs) hzxs
ON xm.HZXSM=hzxs.DM
LEFT OUTER JOIN (select /*+ mapjoin(xmlb)*/ * from dim.hb_xmlb) xmlb
ON xm.XMLBM=xmlb.DM
LEFT OUTER JOIN (select /*+ mapjoin(hdlx)*/ * from dim.hb_hdlx) hdlx
ON xm.HDLXM=hdlx.DM
LEFT OUTER JOIN (select /*+ mapjoin(zxzt)*/ * from dim.hb_xmzxzt) zxzt
ON xm.XMZXZTM=zxzt.DM
LEFT OUTER JOIN (select /*+ mapjoin(xkml)*/ * from dim.hb_xkml) xkml
ON xm.XKMLKJM=xkml.DM
LEFT OUTER JOIN (select /*+ mapjoin(js)*/ * from dim.hb_js) js
ON xm.DWJSM=js.DM
LEFT OUTER JOIN (select /*+ mapjoin(jb)*/ * from dim.hb_jb) jb
ON xm.JBM=jb.DM

LEFT OUTER JOIN (SELECT JHJFZE,XMJFLYM,BRRQ,BKS,ZCRQ,BFXZDWJF,BKDW,XMBH
 FROM fdm.fdm_ky_xmjf WHERE dt='"""+data_day_str+"""') xmjf
ON xm.XMBH=xmjf.XMBH
LEFT OUTER JOIN dim.hb_xmjfly xmjfly
ON xmjf.XMJFLYM=xmjfly.DM
;
"""
hiveShell = """su hdfs -c \"hive -e \\\"""" + sql + """\\\"\""""
print(hiveShell)
os.system(hiveShell)
