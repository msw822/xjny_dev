#!/usr/bin/env python
# -*- coding:utf-8-*-
#===============================================================================
#
#         FILE: gdm_jzg_da.py
#
#        USAGE: ./gdm_jzg_da.py
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
#    TGT_TABLE: gdm_jzg_da
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
INSERT OVERWRITE TABLE gdm.gdm_jzg_da PARTITION (dt = '"""+data_day_str+"""')
SELECT /*+ mapjoin(dw,xb,xzqh,xzqh_gjdq,xzqh_jg,mz,sfzjlx,hyzt,gatqw,zzmm,jkzk,xyzj,xx,xq,xl,whcd,bzld,jzglb,rkzk)*/
 jzg.GH,
 jzg.DWH,
 dw.DWMC        AS DWMC,
 jzg.XM,
 jzg.YWXM,
 jzg.XMPY,
 jzg.CYM,
 jzg.XBM,
 xb.MC          AS XBM_MC,
 CSRQ,
 CSDM,
 xzqh1.xzqhmc   AS CSDM_MC,
 xzqh1.sm       AS CSDM_SM,
 jzg.JGM,
 xzqh_jg.xzqhmc AS JGM_MC,
 xzqh_jg.sm     AS JGM_SM,
 jzg.MZM,
 mz.MC          AS MZM_MC,
 jzg.GJDQM,
 xzqh_gjdq.sm   AS GJDQM_MC,
 jzg.SFZJLXM,
 sfzjlx.MC      AS SFZJLXM_MC,
 jzg.SFZJH,
 jzg.HYZKM,
 hyzt.MC        AS HYZTM_MC,
 jzg.GATQWM,
 gatqw.MC       AS GATQWM_MC,
 jzg.ZZMMM,
 zzmm.MC        AS ZZMMM_MC,
 JKZKM,
 jkzk.MC        AS JKZKM_MC,
 jzg.XYZJM,
 xyzj.DM        AS XYZJM_MC,
 jzg.XXM,
 xx.MC          AS XXM_MC,
 jzg.ZP,
 jzg.SFZJYXQ,
 jzg.XQH,
 xq.XQMC,
 ZGXLM,
 xl.MC          AS ZGXLM_MC,
 jzg.WHCDM,
 whcd.MC        AS WHCDM_MC,
 CJGZNY,
 jzg.LXRQ,
 jzg.QXRQ,
 jzg.CJNY,
 jzg.BZLBM,
 bzlb.MC        AS BZLBM_MC,
 jzg.JZGLBM,
 jzglb.MC       AS JZGLBM_MC,
 jzg.RKZKM,
 rkzk.MC        AS RKZKM_MC,
 jzg.DABH,
 jzg.DAWB,
 jzg.DQZTM,
 jzg.TC,
 jzg.XKLBM,
 NULL           AS XKLBM_MC,
 jzg.YJXKM,
 NULL           AS YJXKM_MC,
 jzg.EJXKM,
 NULL           AS EJXKM_MC,
 jzg.YJFX,
 jzg.ZC
  FROM (SELECT GH,
               DWH,
               XM,
               YWXM,
               XMPY,
               CYM,
               XBM,
               JGM,
               MZM,
               GJDQM,
               SFZJLXM,
               SFZJH,
               HYZKM,
               GATQWM,
               ZZMMM,
               XYZJM,
               XXM,
               ZP,
               SFZJYXQ,
               XQH,
               WHCDM,
               LXRQ,
               QXRQ,
               CJNY,
               BZLBM,
               JZGLBM,
               RKZKM,
               DABH,
               DAWB,
               DQZTM,
               TC,
               XKLBM,
               YJXKM,
               EJXKM,
               YJFX,
               ZC,
               CSDM,
               JKZKM,
               ZGXLM,
               CSRQ,
               CJGZNY
          FROM fdm.fdm_jzg_jbxx
         WHERE dt = '"""+data_day_str+"""') jzg
  LEFT OUTER JOIN (select * from dim.dim_dw) dw
    ON jzg.DWH = dw.DWH
  LEFT OUTER JOIN (select * from dim.hb_xb) xb
    ON jzg.XBM = xb.DM
  LEFT OUTER JOIN (select xzqh, xzqhmc, sm from dim.hb_xzqh) xzqh1
    ON jzg.CSDM = xzqh1.XZQH
  LEFT OUTER JOIN (select xzqh, xzqhmc, sm from dim.hb_xzqh) xzqh_gjdq
    ON jzg.GJDQM = xzqh_gjdq.XZQH
  LEFT OUTER JOIN (select xzqh, xzqhmc, sm from dim.hb_xzqh) xzqh_jg
    ON jzg.CSDM = xzqh_jg.XZQH
  LEFT OUTER JOIN (select * from dim.hb_mz) mz
    ON jzg.MZM = mz.DM
  LEFT OUTER JOIN (select * from dim.hb_sfzjlx) sfzjlx
    ON jzg.SFZJLXM = sfzjlx.DM
  LEFT OUTER JOIN (select * from dim.hb_hyzt) hyzt
    ON jzg.HYZKM = hyzt.DM
  LEFT OUTER JOIN (select * from dim.hb_gatqw) gatqw
    ON jzg.HYZKM = gatqw.DM
  LEFT OUTER JOIN (select * from dim.hb_zzmm) zzmm
    ON jzg.ZZMMM = zzmm.DM
  LEFT OUTER JOIN (select * from dim.hb_jkzk) jkzk
    ON jzg.JKZKM = jkzk.DM
  LEFT OUTER JOIN (select * from dim.hb_xyzj) xyzj
    ON jzg.XYZJM = xyzj.DM
  LEFT OUTER JOIN (select * from dim.HB_xx) xx
    ON jzg.XXM = xx.DM
  LEFT OUTER JOIN (select * from dim.dim_xq) xq
    ON jzg.XQH = xq.XQH
  LEFT OUTER JOIN (select * from dim.hb_xl) xl
    ON jzg.ZGXLM = xl.DM
  LEFT OUTER JOIN (select * from dim.hb_whcd) whcd
    ON jzg.WHCDM = whcd.DM
  LEFT OUTER JOIN (select * from dim.hb_bzlb) bzlb
    ON jzg.BZLBM = bzlb.DM
  LEFT OUTER JOIN (select * from dim.hb_jzglb) jzglb
    ON jzg.JZGLBM = jzglb.DM
  LEFT OUTER JOIN (select * from dim.hb_rkzk) rkzk
    ON jzg.RKZKM = rkzk.DM
;
"""
hiveShell = """su hdfs -c \"hive -e \\\"""" + sql + """\\\"\""""
print(hiveShell)
os.system(hiveShell)