# -*- coding:utf-8-*-
#===============================================================================
#
#         FILE: edu_app_dxf_yj.py
#
#        USAGE: ./edu_app_dxf_yj.py
#
#  DESCRIPTION:不是最终脚本，需要根据业务进行修改
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
#    SRC_TABLE:gdm_ykt_jy_log
#    TGT_TABLE: edu_app_dxf_yj
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

INSERT OVERWRITE TABLE app.edu_app_dxf_yj PARTITION (dt='"""+data_day_str+"""')
SELECT rxf.xh as xh,
       rxf.xm as xm,
       rxf.ssyxm as YXDM,
       rxf.ssyxm_mc as YXMC,
       rxf.zym as ZYDM,
       rxf.zym_mc as ZYMC,
       rxf.szbh as BJDM,
       rxf.bjmc as BJMC,
       rxf.sznj as XZNJ,
       substr(rxf.dt, 1, 10) as rq,
       count(case
               when rxf.jysj_h >= '06:00:00' and rxf.jysj_h < '12:00:00' then
                1
               else
                0
             end) as SFZC,
       count(case
               when rxf.jysj_h >= '12:00:00' and rxf.jysj_h < '16:00:00' then
                1
               else
                0
             end) as SFZHC,
       count(case
               when rxf.jysj_h >= '16:00:00' and rxf.jysj_h < '24:00:00' then
                1
               else
                0
             end) as SFWC,
       sum(case
             when rxf.jysj_h >= '06:00:00' and rxf.jysj_h < '12:00:00' then
              rxf.jyje
             else
              0
           end) as ZCXF,
       sum(case
             when rxf.jysj_h >= '12:00:00' and rxf.jysj_h < '16:00:00' then
              rxf.jyje
             else
              0
           end) as ZHCXF,
       sum(case
             when rxf.jysj_h >= '16:00:00' and rxf.jysj_h < '24:00:00' then
              rxf.jyje
             else
              0
           end) as WCXF,
       min(case
             when rxf.jysj_h >= '06:00:00' and rxf.jysj_h < '10:00:00' and
                  rxf.shlbmc in ('食堂') then
              rxf.shmc
             else
              null
           end) as ZCST,
       min(case
             when rxf.jysj_h >= '10:00:00' and rxf.jysj_h < '16:00:00' and
                  rxf.shlbmc in ('食堂') then
              rxf.shmc
             else
              null
           end) as ZHCST,
       min(case
             when rxf.jysj_h >= '16:00:00' and rxf.jysj_h < '22:00:00' and
                  rxf.shlbmc in ('食堂') then
              rxf.shmc
             else
              null
           end) as WCST,
       sum(rxf.jyje) as JRZXF

  from (select xh,
               xm,
               ssyxm,
               ssyxm_mc,
               zym,
               zym_mc,
               szbh,
               bjmc,
               sznj,
               dt,
               SUBSTR(jysj, 1, 10) AS xfrq,
               SUBSTR(jysj, 12, 8) AS jysj_h,
               jyje,
               shmc,
               shlbmc
          from gdm.gdm_ykt_jy_log
         WHERE dt = '"""+data_day_str+"""'
           AND jylx in ('消费')) rxf
 group by rxf.xh,
          rxf.xm,
          rxf.ssyxm,
          rxf.ssyxm_mc,
          rxf.zym,
          rxf.zym_mc,
          rxf.szbh,
          rxf.bjmc,
          rxf.sznj,
          rxf.dt
;
"""
hiveShell = """su hdfs -c \"hive -e \\\"""" + sql + """\\\"\""""
print(hiveShell)
os.system(hiveShell)