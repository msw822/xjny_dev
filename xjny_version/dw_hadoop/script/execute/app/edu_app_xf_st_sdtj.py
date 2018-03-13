# -*- coding:utf-8-*-
#===============================================================================
#
#         FILE: edu_app_xf_st_sdtj.py
#
#        USAGE: ./edu_app_xf_st_sdtj.py
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
#    SRC_TABLE:gdm_ykt_jy_log
#    TGT_TABLE: edu_app_xf_st_sdtj
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

INSERT OVERWRITE TABLE app.edu_app_xf_st_sdtj PARTITION (dt='"""+data_day_str+"""')
select a.shdm as stbh,
       a.shmc as stmc,
       a.xfrq as yyrq,
       sum(case
             when a.jysj_h >= '06:00:00' and a.jysj_h < '10:00:00' then
              a.jyje
             else
              0
           end) as zcyyje,
       sum(case
             when a.jysj_h >= '10:00:00' and a.jysj_h < '16:00:00' then
              a.jyje
             else
              0
           end) as wcyyje,
       sum(case
             when a.jysj_h >= '16:00:00' and a.jysj_h < '22:00:00' then
              a.jyje
             else
              0
           end) as wacyyje,
       sum(case
             when a.jysj_h >= '22:00:00' and a.jysj_h < '06:00:00' then
              a.jyje
             else
              0
           end) as qtsdyyje
  from (select shmc,
               shdm,
               jyje,
               dt,
               SUBSTR(jysj, 1, 10) AS xfrq,
               SUBSTR(jysj, 12, 8) AS jysj_h
          from gdm.gdm_ykt_jy_log
         where jylx in ('消费')
           and shlbmc in ('食堂')
           and dt = '"""+data_day_str+"""') a
 group by a.shdm, a.shmc, a.xfrq
;
"""
hiveShell = """su hdfs -c \"hive -e \\\"""" + sql + """\\\"\""""
print(hiveShell)
os.system(hiveShell)