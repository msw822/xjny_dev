#!/usr/bin/env python
# -*- coding:utf-8-*-
#===============================================================================
#
#         FILE: edu_app_mj_zjhd.py
#
#        USAGE: ./edu_app_mj_zjhd.py
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
#      CREATED: 2018/02/26
#     REVIEWER:
#     REVISION: ---
#    SRC_TABLE:gdm_ykt_jy_log,fdm_xs_mj_log,
#    TGT_TABLE: edu_app_mj_zjhd
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
data_newest_str="2999-12-31"
sql = """
set mapred.output.compress=true; 
set hive.exec.compress.output=true; 
set mapred.output.compression.codec=org.apache.hadoop.io.compress.SnappyCodec; 
set mapred.output.compression.type=block;

INSERT OVERWRITE TABLE app.edu_app_mj_zjhd PARTITION (dt='"""+data_day_str+"""')
SELECT 
* FROM 

(SELECT 
       '"""+data_day_str+"""',
       jbxx.xh,
       jbxx.xm,
       jbxx.SSYXM,
       jbxx.SSYXM_MC,
       jbxx.ZYM,
       jbxx.ZYM_MC,
       jbxx.SZBH,
       jbxx.BJMC,
       jbxx.SZNJ,
       jbxx.xz,
       xf.zhxfsj as ZHXFSJ,
       js.zhjssj AS ZHMJSJ,
       mj.zhmjsj as ZHSWSJ
  from( SELECT xh,xm,SSYXM,SSYXM_MC,ZYM,ZYM_MC,SZBH,BJMC,SZNJ,xz FROM gdm.gdm_xs_jbxx_da 
        WHERE dt='"""+data_newest_str+"""' and xh like '22%') jbxx
  LEFT OUTER JOIN (select xh, MAX(jysj) AS zhxfsj
                     from gdm.gdm_ykt_jy_log 
                    WHERE dt = '"""+data_day_str+"""' 
                    GROUP BY xh) xf
    ON xf.xh = jbxx.xh
  LEFT JOIN (select xh, max(SKSJ) as zhjssj
               from fdm.fdm_xs_mj_log
              WHERE dt = '"""+data_day_str+"""'
              group by xh) js
    on js.xh = jbxx.xh
  left join (select xh, MAX(LOGIN_TIME) as zhmjsj
               from fdm.fdm_sw_log
              WHERE dt = '"""+data_day_str+"""'
              group by xh) mj
    on mj.xh = jbxx.xh) AS zjhd  WHERE zjhd.ZHXFSJ is not null OR zjhd.ZHMJSJ IS NOT NULL OR zjhd.ZHSWSJ IS NOT NULL
;
"""
hiveShell = """su hdfs -c \"hive -e \\\"""" + sql + """\\\"\""""
print(hiveShell)
os.system(hiveShell)