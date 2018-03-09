#!/usr/bin/env python
# -*- coding:utf-8-*-
#===============================================================================
#
#         FILE: edu_app_ks_cjxq.py
#
#        USAGE: ./edu_app_ks_cjxq.py
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
#      CREATED: 2018/03/03
#     REVIEWER:
#     REVISION: ---
#    SRC_TABLE:gdm_kc_kccj_xq
#    TGT_TABLE: edu_app_ks_cjxq
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
INSERT OVERWRITE TABLE app.edu_app_ks_cjxq PARTITION(xn='"""+xn+"""',xqm='"""+xqm+"""')
SELECT COALESCE(zgdf.xh, bxq_gk.xh, bxq_bk.xh,bxq_jq.xh) as xh,
       COALESCE(zgdf.xqm_mc, bxq_gk.xqm_mc, bxq_bk.xqm_mc,bxq_jq.xqm_mc) as xq,
       COALESCE(bxq_gk.kcsxm_mc, bxq_jq.kcsxm_mc) as kclx,
       bxq_gk.gksl,
       bxq_gk.bxq_gkxf,
       bxq_jq.bxq_jqpjf,
       zgdf.zgdfkcm,
       zgdf.zgdffs,
       bxq_bk.bxq_bksl,
       bxq_bk.bxq_bkxf
  FROM (SELECT xh, xqm_mc, kcsxm_mc, kcmc as zgdfkcm, kccj_jg as zgdffs
          FROM (SELECT xqm_mc,
                       xh,
                       kcsxm_mc,
                       kcmc,
                       kccj_jg,
                       row_number() over(partition by xh, xn, xqm order by kccj_jg desc) as rank
                  FROM gdm.gdm_kc_kccj_xq
                 WHERE xn = '"""+xn+"""'
                   AND xqm = '"""+xqm+"""' and  xh like '22%') tmp
         where rank = 1) zgdf

  FULL OUTER JOIN (SELECT xh,
                          xqm_mc,
                          kcsxm_mc,
                          count(1) as gksl,
                          sum(xf) as bxq_gkxf
                     FROM (SELECT xqm_mc,
                                  xh,
                                  kcsxm_mc,
                                  xf,
                                  kccj_jg,
                                  row_number() over(partition by xh, xn, xqm, kch order by xh, xn, xqm, kch, kccj_jg desc) as rank
                             FROM gdm.gdm_kc_kccj_xq
                            WHERE xn = '"""+xn+"""'
                              AND xqm = '"""+xqm+"""' and  xh like '22%') tmp
                    where rank = 1
                      AND kccj_jg < 60
                    GROUP by xh,xqm_mc,kcsxm_mc) bxq_gk
    ON (bxq_gk.xh = zgdf.xh AND bxq_gk.xqm_mc = zgdf.xqm_mc AND
       bxq_gk.kcsxm_mc = zgdf.kcsxm_mc)

  FULL OUTER JOIN (SELECT xh,
                          xqm_mc,
                          kcsxm_mc,
                          count(1) as bxq_bksl,
                          sum(xf) as bxq_bkxf
                     FROM (SELECT xqm_mc, xh, kcsxm_mc, xf
                             FROM gdm.gdm_kc_kccj_xq
                            WHERE xn = '"""+xn+"""'
                              AND xqm = '"""+xqm+"""' and  xh like '22%'
                              AND ksxzm in ('11', '12')) tmp
                    GROUP by xh, xqm_mc, kcsxm_mc) bxq_bk
    ON (bxq_bk.xh = zgdf.xh AND bxq_bk.xqm_mc = zgdf.xqm_mc AND
       bxq_bk.kcsxm_mc = zgdf.kcsxm_mc)
  FULL OUTER JOIN (SELECT xh,
                          xqm_mc,
                          kcsxm_mc,
                          sum(xf_hd * kccj_jg) / sum(xf_hd) AS bxq_jqpjf
                     FROM (SELECT xqm_mc, xh, kcsxm_mc, xf_hd,kccj_jg
                             FROM gdm.gdm_kc_kccj_xq
                            WHERE xn = '"""+xn+"""'
                              AND xqm = '"""+xqm+"""'  and  xh like '22%' ) tmp
                    GROUP by xh, xqm_mc, kcsxm_mc) bxq_jq 
     ON (bxq_jq.xh = zgdf.xh AND bxq_jq.xqm_mc = zgdf.xqm_mc AND
       bxq_jq.kcsxm_mc = zgdf.kcsxm_mc)
;
"""
hiveShell = """su hdfs -c \"hive -e \\\"""" + sql + """\\\"\""""
print(hiveShell)
os.system(hiveShell)

