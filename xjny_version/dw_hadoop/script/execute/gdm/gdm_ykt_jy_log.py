#!/usr/bin/env python
# -*- coding:utf-8-*-
#===============================================================================
#
#         FILE: gdm_ykt_jy_log.py
#
#        USAGE: ./gdm_ykt_jy_log.py
#
#  DESCRIPTION: 学生基本信息表，全量表
#
#      OPTIONS: ---
# REQUIREMENTS: gdm_xs_jbxx_da
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: li.zhanlei@h3c.com
#      COMPANY: bigdata.h3c.com
#      VERSION: 1.0
#      CREATED: 2018/02/11
#     REVIEWER:
#     REVISION: ---
#    SRC_TABLE: gdm_xs_jbxx_da
#    TGT_TABLE: gdm_ykt_jy_log
#===============================================================================
import sys
import os
import datetime

if len(sys.argv)>1:
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
#data_day_int = (datetime.datetime.strptime(data_day_str, '%Y-%m-%d')).strftime('%Y%m%d')
data_newest_str="2999-12-31"

sql = """
set mapred.output.compress=true; 
set hive.exec.compress.output=true; 
set mapred.output.compression.codec=org.apache.hadoop.io.compress.SnappyCodec; 
set mapred.output.compression.type=block;
INSERT  overwrite table gdm.gdm_ykt_jy_log PARTITION (dt='"""+data_day_str+"""')
SELECT E.XH,
       B.XM,
       B.XBM,
       B.XBM_MC,
       B.RXNY,
       B.SZNJ,
       B.SZBH,
       B.BJMC,
       B.ZYM,
       B.ZYM_MC,
       B.SSYXM,
       B.SSYXM_MC,
       B.PYCCM,
       B.PYCCM_MC,
       B.SFZJH,
       B.CSRQ,
       A.KH,
       A.KXL,
       A.JYLX,
       A.JYJE,
       A.JYLSH,
       A.JYRQ,
       A.JYSJ,
       A.JYDD,
       A.SHDM,
       C.SHMC,
       C.SHLBDM,
       C.SHLBMC,
       A.ZDJH,
       A.LJYKCS,
       A.JYYE,
       B.LYDQM,
       NVL(B.LYDQM_SM, '其他'),
       B.JGM,
       NVL(B.JGM_SM, '其他')
  FROM (SELECT KH,
               KXL,
               JYLX,
               JYJE,
               JYLSH,
               JYRQ,
               JYSJ,
               JYDD,
               SHDM,
               ZDJH,
               LJYKCS,
               JYYE
          FROM fdm.fdm_ykt_jy_log
         WHERE dt = '"""+data_day_str+"""') A
  LEFT OUTER JOIN (SELECT XH, KH
                     FROM fdm.fdm_ykt_xx
                    WHERE dt = '"""+data_day_str+"""') E
    ON A.KH = E.KH
  LEFT OUTER JOIN (SELECT XH,
                          XM,
                          XBM,
                          XBM_MC,
                          RXNY,
                          SZNJ,
                          SZBH,
                          BJMC,
                          ZYM,
                          ZYM_MC,
                          SSYXM,
                          SSYXM_MC,
                          PYCCM,
                          PYCCM_MC,
                          SFZJH,
                          CSRQ,
                          LYDQM,
                          LYDQM_SM,
                          JGM,
                          JGM_SM
                     FROM gdm.gdm_xs_jbxx_da
                    WHERE dt = '"""+data_newest_str+"""') B
    ON E.XH = B.XH
  LEFT OUTER JOIN (SELECT SHMC, SHLBDM, SHDM, SHLBMC
                     FROM fdm.fdm_ykt_shxx
                    WHERE dt = '"""+data_newest_str+"""') C
    ON A.SHDM = C.SHDM;
;
"""
hiveShell = """su hdfs -c \"hive -e \\\"""" + sql + """\\\"\""""
print(hiveShell)
os.system(hiveShell)
print('finish--')
