#!/usr/bin/env python
# -*- coding:utf-8-*-
#===============================================================================
#
#         FILE: gdm_xs_jbxx_da.py
#
#        USAGE: ./gdm_xs_jbxx_da.py
#
#  DESCRIPTION: 学生基本信息表，全量表
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
#    SRC_TABLE: fdm_xs_jbxx
#    TGT_TABLE: gdm_xs_jbxx_da
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
INSERT OVERWRITE TABLE gdm.gdm_xs_jbxx_da PARTITION (dt = '"""+data_day_str+"""')
SELECT xsjbxx.XH,
       xsjbxx.XM,
       xsjbxx.XBM,
       xb.MC AS XBM_MC,
       xsjbxx.CSRQ,
       xsjbxx.JGM,
       xzqh.XZQHMC AS JGM_MC,
       xzqh.SM AS JGM_SM,
       xsjbxx.MZM,
       mz.MC AS MZM_MC,
       xsjbxx.GJDQM,
       NULL AS GJDQM_MC,
       xsjbxx.SFZJLXM,
       SFZJLX.MC AS SFZJM_MC,
       xsjbxx.SFZJH,
       xsjbxx.HYZKM,
       HYZK.MC AS HYZKM_MC,
       xsjbxx.XYZJM,
       XYZJ.MC AS XYZJM_MC,
       xsjbxx.XXM,
       XX.MC AS XXM_MC,
       xsjbxx.SFZJYXQ,
       xsjbxx.SFDSZN,
       xsjbxx.SFZX,
       xslyxx.YXXMC,
       xslyxx.RXFSM,
       RXFS.MC AS RXFSM_MC,
       xslyxx.LYDQM,
       xzqh.XZQHMC AS LYDQM_MC,
       xzqh.SM AS LYDQM_SM,
       xslyxx.SYDM,
       xzqh.XZQHMC AS SYDM_MC,
       xzqh.SM AS SYDM_SM,
       xslyxx.JDFSM,
       jdfs.MC AS JDFSM_MC,
       xslyxx.LYGBDQM,
       NULL AS LYGBDQM_MC,
       xslyxx.DXWPDW,
       xslyxx.RXQXLM,
       XL.MC AS RXQXLM_MC,
       xslyxx.RXQXWM,
       XW.MC AS RXQXWM_MC,
       xjxx.RXNY,
       xjxx.XSLBM,
       XSLB.MC AS XSLBM_MC,
       COALESCE(xjxx.XZ, bjxx.XZ) AS XZ,
       COALESCE(xjxx.ZYM, bjxx.SSZYM) AS ZYM,
       COALESCE(bzkzy.mc, bjxx.SSZYMC) AS ZYM_MC,
       xjxx.SZBH,
       bjxx.BJMC,
       COALESCE(xjxx.SZNJ, bjxx.SSNJ) AS SZNJ,
       xjxx.XSDQZTM,
       xsdqzt.MC AS XSDQZTM_MC,
       COALESCE(xjxx.SSXYM, bjxx.SSYXM) AS SSYXM,
       COALESCE(dw_3.DWMC) AS SSYXM_MC,
       xjxx.XKMLM AS XKMLM,
       XKML.MC AS XKMLM_MC,
       xjxx.PYFSM,
       pyfs.MC AS PYFSM_MC,
       xjxx.YJFX,
       xjxx.DSH,
       JZG.XM AS DSH_XM,
       xjxx.HDXLFSM,
       hdxlfs.MC AS HDXLFSM_MC,
       xjxx.PYCCM,
       pycc.MC as PYCCM_MC,
       xjxx.LDFSM,
       NULL AS LDFSM_MC,
       dw_3.LSDWH,
       dw_3.DWLBM,
       dw_3.DWJB,
       zsxx.SSFJH,
       ZZMM.MC,
       XQXX.XQH,
       XQXX.XQMC,
       xsjbxx.ZP
  FROM (SELECT XH,XM,XXM,XBM,CSRQ,HYZKM,JGM,MZM,GJDQM,SFZJH,SFZJYXQ,SFZJLXM,SFDSZN,SFZX,XYZJM,ZP,ZZMMM FROM fdm.fdm_xs_jbxx WHERE dt='"""+data_day_str+"""') xsjbxx
  LEFT OUTER JOIN (SELECT XH,YXXMC,RXFSM,LYDQM,SYDM,JDFSM,LYGBDQM,DXWPDW,RXQXLM,RXQXWM 
  FROM fdm.FDM_XS_LYXX WHERE dt='"""+data_day_str+"""') xslyxx ON TRIM(xsjbxx.XH) =
                                             TRIM(xslyxx.XH)
  LEFT OUTER JOIN (SELECT XH,RXNY,XSLBM,XZ,ZYM,SZBH,SZNJ,XSDQZTM,SSXYM,XKMLM,PYFSM,YJFX,DSH,HDXLFSM,PYCCM,LDFSM 
  FROM fdm.FDM_XS_XJXX WHERE dt='"""+data_day_str+"""') xjxx ON TRIM(xsjbxx.XH) = TRIM(xjxx.XH)
  LEFT OUTER JOIN (select /*+ mapjoin(bjxx)*/ * from dim.dim_bjxx) bjxx ON TRIM(xjxx.SZBH) = TRIM(bjxx.BH)
  LEFT OUTER JOIN (select /*+ mapjoin(bzkzy)*/ * from dim.hb_bzkzy) bzkzy ON TRIM(xjxx.ZYM) =
                                           TRIM(bzkzy.dm)
  LEFT OUTER JOIN (select /*+ mapjoin(dw_3)*/ * from dim.dim_dw) dw_3 ON TRIM(xjxx.SSXYM) = TRIM(dw_3.DWH)
  LEFT OUTER JOIN (select /*+ mapjoin(pyfs)*/ * from dim.hb_pyfs) pyfs ON TRIM(xjxx.PYFSM) = TRIM(pyfs.DM)
  LEFT OUTER JOIN (select /*+ mapjoin(hdxlfs)*/ * from dim.hb_hdxlfs) hdxlfs ON TRIM(xjxx.HDXLFSM) =
                                              TRIM(hdxlfs.DM)
  LEFT OUTER JOIN (select /*+ mapjoin(xsdqzt)*/ * from dim.hb_xsdqzt) xsdqzt ON TRIM(xjxx.XSDQZTM) =
                                              TRIM(xsdqzt.DM)
  LEFT OUTER JOIN (select /*+ mapjoin(xb)*/ * from dim.hb_xb) xb ON TRIM(xsjbxx.XBM) = TRIM(xb.DM)
  LEFT OUTER JOIN (select /*+ mapjoin(xzqh)*/ * from dim.hb_xzqh)  xzqh ON (TRIM(xsjbxx.JGM) =TRIM(xzqh.XZQH)
  AND TRIM(xslyxx.SYDM) =TRIM(xzqh.XZQH) AND  TRIM(xslyxx.LYDQM) =TRIM(xzqh.XZQH))
  LEFT OUTER JOIN (select /*+ mapjoin(jdfs)*/ * from dim.hb_jdfs) jdfs ON TRIM(xslyxx.JDFSM) =
                                          TRIM(jdfs.DM)
  LEFT OUTER JOIN (select /*+ mapjoin(pycc)*/ * from dim.hb_pycc) pycc ON TRIM(xjxx.PYCCM) = TRIM(pycc.DM)
  LEFT OUTER JOIN (select /*+ mapjoin(mz)*/ * from dim.hb_mz) mz ON TRIM(xsjbxx.MZM) = mz.DM
  LEFT OUTER JOIN (SELECT SSFJH,XH,XQH FROM fdm.fdm_xs_zsxx WHERE dt='"""+data_day_str+"""') zsxx ON TRIM(xsjbxx.XH) = TRIM(zsxx.XH)
  LEFT OUTER JOIN (select /*+ mapjoin(ZZMM)*/ * from dim.HB_ZZMM)   ZZMM ON TRIM(XSJBXX.ZZMMM) = TRIM(ZZMM.DM)
  LEFT OUTER JOIN (SELECT XQH,XQMC FROM FDM.FDM_XQXX WHERE dt='"""+data_day_str+"""') XQXX ON TRIM(zsxx.xqh) = TRIM(XQXX.XQH)
  LEFT OUTER JOIN (select /*+ mapjoin(SFZJLX)*/ * from dim.HB_SFZJLX) SFZJLX ON TRIM(SFZJLX.DM) = TRIM(xsjbxx.SFZJLXM)
  LEFT OUTER JOIN (select /*+ mapjoin(HYZK)*/ * from dim.HB_HYZT) HYZK ON TRIM(HYZK.DM) = TRIM(xsjbxx.HYZKM)
  LEFT OUTER JOIN (select /*+ mapjoin(XYZJ)*/ * from dim.HB_XYZJ) XYZJ ON TRIM(XYZJ.DM) = TRIM(xsjbxx.XYZJM)
  LEFT OUTER JOIN (select /*+ mapjoin(XX)*/ * from dim.HB_XX) XX ON TRIM(XX.DM) = TRIM(xsjbxx.XXM)
  LEFT OUTER JOIN (select /*+ mapjoin(RXFS)*/ * from dim.HB_RXFS) RXFS ON TRIM(RXFS.DM) = TRIM(xslyxx.RXFSM)
  LEFT OUTER JOIN (select /*+ mapjoin(XL)*/ * from dim.HB_XL) XL ON TRIM(XL.DM) = TRIM(xslyxx.RXQXLM)
  LEFT OUTER JOIN (select /*+ mapjoin(XW)*/ * from dim.HB_XW) XW ON TRIM(XW.DM) = TRIM(xslyxx.RXQXWM)
  LEFT OUTER JOIN (select /*+ mapjoin(XSLB)*/ * from dim.HB_XSLB) XSLB ON TRIM(XSLB.DM) = TRIM(xjxx.XSLBM)
  LEFT OUTER JOIN (select /*+ mapjoin(XKML)*/ * from dim.HB_XKML) XKML ON TRIM(XKML.DM) = TRIM(xjxx.XKMLM)
  LEFT OUTER JOIN (SELECT GH,XM FROM FDM.FDM_JZG_JBXX WHERE dt='"""+data_day_str+"""') JZG ON TRIM(JZG.GH) = TRIM(xjxx.DSH)
 ;
"""
hiveShell = """su hdfs -c \"hive -e \\\"""" + sql + """\\\"\""""
print(hiveShell)
os.system(hiveShell)
