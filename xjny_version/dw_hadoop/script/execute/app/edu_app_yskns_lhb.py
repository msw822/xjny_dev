#!/usr/bin/env python
# -*- coding:utf-8-*-
#===============================================================================
#
#         FILE: edu_app_yskns_lhb.py
#
#        USAGE: ./edu_app_yskns_lhb.py
#
#  DESCRIPTION:疑似家庭困难生量化计算。此脚本不是最终的，需要修改
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: li.zhanlei@h3c.com
#      COMPANY: bigdata.h3c.com
#      VERSION: 1.0
#      CREATED: 2018/02/26
#     REVIEWER: li.zhanlei
#     REVISION: ---
#    SRC_TABLE:
#    TGT_TABLE: edu_app_yskns_lhb
#===============================================================================
import sys
import os
import datetime

sys.path.append(os.path.dirname(os.path.dirname(os.getcwd())))
#from funcs.GetKeyByTime import getXNandXQByStr12

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
data_newest_str="2999-12-31"
sql = """
set mapred.output.compress=true;
set hive.exec.compress.output=true;
set mapred.output.compression.codec=org.apache.hadoop.io.compress.SnappyCodec;
set mapred.output.compression.type=block;
INSERT OVERWRITE TABLE app.edu_app_yskns_lhb PARTITION(dt='"""+data_day_str+"""')
select xsxx.xh        as xh,
       null           as FQSFCJ,
       null           as FQSFSW,
       null           as MQSFCJ,
       null           as MQSFSW,
       null           as JTNZSR,
       null           as ZXDKZJE,
       null           as QJXFJE,
       null           as SFPK_ZP,
       null           as SFPK_FDY,
       qxxf.qx_yjxfcs as QX_YJJCCS,
       grxf.yjxfcs    as YJJCCS,
       qxxf.qx_yjxfje as QX_YJXF,
       grxf.yjxfje    as YJXF,
       qxxf.qx_cjxf   as QX_CJXF,
       grxf.cjxf      as CJXF,
       null           as QGJXCS
  from gdm.gdm_xs_jbxx_da xsxx
  full outer join (select qx_tmp.qxxfcs / zrs_tmp.zrs as qx_yjxfcs,
                          qx_tmp.qxzxfje / zrs_tmp.zrs as qx_yjxfje,
                          qx_tmp.qxzxfje / qx_tmp.qxxfcs as qx_cjxf
                     from (select count(1) AS qxxfcs, SUM(jyje) AS qxzxfje
                             from gdm.gdm_ykt_jy_log
                            WHERE substr(jyrq, 1, 7) =
                                  substr(add_months(to_date(substr('"""+data_day_str+"""',1,10)),-1),1,7)
                              AND jylx in ('消费')) qx_tmp
                     left join (select count(1) as zrs
                                 from gdm.gdm_ykt_jy_log
                                group by xh) zrs_tmp
                       on 1 = 1) qxxf
    on 1 = 1
  left join (select xh,
                    count(1) AS yjxfcs,
                    SUM(jyje) AS yjxfje,
                    sum(jyje) / count(1) as cjxf
               from gdm.gdm_ykt_jy_log
              WHERE substr(jyrq, 1, 7) =
                    substr(add_months(to_date(substr('"""+data_day_str+"""',1,10)),-1),1,7)
                 AND jylx in ('消费')
              group by xh) grxf
    on xsxx.xh = grxf.xh
;
"""
hiveShell = """su hdfs -c \"hive -e \\\"""" + sql + """\\\"\""""
print(hiveShell)
os.system(hiveShell)

