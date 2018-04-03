#!/usr/bin/env python
# -*- coding:utf-8-*-
#===============================================================================
#
#         FILE: gdm_kc_kccj_xq.py
#
#        USAGE: ./gdm_kc_kccj_xq.py 2018-02-27 或无参数
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
#    SRC_TABLE:gdm_xs_jbxx_da
#    TGT_TABLE: gdm_kc_kccj_da
#===============================================================================

import sys
import os
import datetime
sys.path.append( os.path.dirname(os.path.dirname(os.getcwd())))
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
sql = """
set mapred.output.compress=true; 
set hive.exec.compress.output=true; 
set mapred.output.compression.codec=org.apache.hadoop.io.compress.SnappyCodec; 
set mapred.output.compression.type=block;
INSERT OVERWRITE TABLE gdm.gdm_kc_kccj_xq PARTITION(xn = '"""+xn+"""', xqm= '"""+xqm+"""')
SELECT /*+ mapjoin(ksxs,ksxz,ksfs,kcsx,xq)*/
 xq.MC AS XQM_MC,
 xsjb.XM,
 kccj.XH,
 kccj.JXBH,
 COALESCE(kcap.KCMC, kcjb.kcmc),
 kccj.KSFSM,
 ksfs.MC AS KSFSM_MC,
 kccj.KSXZM,
 ksxz.MC AS KSXZM_MC,
 kccj.KSXSM,
 ksxs.MC AS KSXSM_MC,
 kccj.PSCJ,
 kccj.ZSCJ,
 kccj.KCCJ,
 kccj.KCCJ_JG,
 COALESCE(kccj.XF, kcap.XF) XF,
 kccj.XF_HD,
 COALESCE(KCCJ.XS, kcap.ZXS) XS,
 kccj.KCSXM,
 COALESCE(kcap.KCSXM_MC, kcjb.kczx) AS KCSXM_MC,
 kccj.PM,
 kccj.JD,
 xsjb.XBM,
 xsjb.XBM_MC,
 xsjb.JGM,
 xsjb.JGM_MC,
 xsjb.JGM_SM,
 xsjb.SFZJH,
 xsjb.XXM,
 xsjb.XXM_MC,
 xsjb.SFDSZN,
 xsjb.YXXMC,
 xsjb.RXFSM,
 xsjb.RXFSM_MC,
 xsjb.LYDQM,
 xsjb.LYDQM_MC,
 xsjb.LYDQM_SM,
 xsjb.RXNY,
 xsjb.XZ,
 xsjb.ZYM,
 xsjb.ZYM_MC,
 xsjb.SZBH,
 xsjb.BJMC,
 xsjb.SZNJ,
 xsjb.SSYXM,
 xsjb.PYCCM,
 xsjb.PYCCM_MC
  FROM (SELECT XN,
               XQM,
               XH,
               KCH,
               KSFSM,
               KSXZM,
               KSXSM,
               PSCJ,
               ZSCJ,
               KCCJ,
               KCCJ_JG,
               XF,
               XF_HD,
               XS,
               PM,
               JD,
               JXBH,
               KCSXM
          FROM fdm.fdm_kc_cjjbxx
         WHERE xn = '"""+xn+"""'
           AND xqm = '"""+xqm+"""') kccj
  LEFT OUTER JOIN (SELECT XM,
                          XH,
                          XBM,
                          XBM_MC,
                          JGM,
                          JGM_MC,
                          JGM_SM,
                          SFZJH,
                          XXM,
                          XXM_MC,
                          SFDSZN,
                          YXXMC,
                          RXFSM,
                          RXFSM_MC,
                          LYDQM,
                          LYDQM_MC,
                          LYDQM_SM,
                          RXNY,
                          XZ,
                          ZYM,
                          ZYM_MC,
                          SZBH,
                          BJMC,
                          SZNJ,
                          SSYXM,
                          PYCCM,
                          PYCCM_MC
                     FROM gdm.gdm_xs_jbxx_da
                    WHERE dt = '"""+data_newest_str+"""') xsjb
    ON kccj.XH = xsjb.XH
  LEFT OUTER JOIN    (SELECT JXBH,KCMC,XF,ZXS,KCSXM_MC FROM fdm.fdm_jw_pkap ) kcap
    ON kccj.jxbh = kcap.JXBH    
  LEFT OUTER JOIN (SELECT KCH, KCMC,KCZX
                     FROM fdm.fdm_kc_jbxx
                    WHERE dt = '"""+data_newest_str+"""') kcjb
    ON kccj.KCH = kcjb.KCH 
  LEFT OUTER JOIN (select * from dim.hb_ksxs) ksxs
    ON kccj.KSXSM = ksxs.DM
  LEFT OUTER JOIN (select * from dim.hb_ksxz) ksxz
    ON kccj.KSXZM = ksxz.DM
  LEFT OUTER JOIN (select * from dim.hb_ksfs) ksfs
    ON kccj.KSFSM = ksfs.DM
  LEFT OUTER JOIN (select * from dim.hb_kcsx) kcsx
    ON kccj.KCSXM = kcsx.DM
  LEFT OUTER JOIN (select * from dim.hb_xq) xq
    ON kccj.XQM = xq.DM;
"""
hiveShell = """su hdfs -c \"hive -e \\\"""" + sql + """\\\"\""""
print(hiveShell)
os.system(hiveShell)

