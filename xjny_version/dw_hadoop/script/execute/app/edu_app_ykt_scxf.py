# -*- coding:utf-8-*-
#===============================================================================
#
#         FILE: edu_app_ykt_scxf.py
#
#        USAGE: ./edu_app_ykt_scxf.py
#
#  DESCRIPTION: 本脚本不是最终的，需要定制，考虑的参数：消费类型(充值，消费 等) ，消费类型（就餐、商铺 等) ,早中餐的分类
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
#    TGT_TABLE: edu_app_ykt_scxf
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

INSERT OVERWRITE TABLE app.edu_app_ykt_scxf PARTITION (dt='"""+data_day_str+"""')
SELECT xh,
       xfrq,
       SUM(CASE
             WHEN jysj_h >= '07:00:00' AND jysj_h < '12:00:00' THEN
              jyje
             ELSE
              0
           END) AS zcxfje,
       MIN(CASE
             WHEN jysj_h >= '06:00:00' AND jysj_h < '12:00:00' THEN
              jysj_h
           END) as zxxfsj,
       SUM(CASE
             WHEN jysj_h >= '12:00:00' AND jysj_h < '16:00:00' THEN
              jyje
             ELSE
              0
           END) AS wcxfje,
       MIN(CASE
             WHEN jysj_h >= '12:00:00' AND jysj_h < '16:00:00' THEN
              jysj_h
           END) AS wcxfsj,
       
       SUM(CASE
             WHEN jysj_h >= '16:00:00' AND jysj_h < '24:00:00' THEN
              jyje
             ELSE
              0
           END) AS wacxfje,
       MIN(CASE
             WHEN jysj_h >= '16:00:00' AND jysj_h < '24:00:00' THEN
              jysj_h
           END) AS wacxfsj
  FROM (SELECT xh,
               SUBSTR(jysj, 1, 10) AS xfrq,
               SUBSTR(jysj, 12, 8) AS jysj_h,
               xfjl.jyje
          FROM gdm.gdm_ykt_jy_log xfjl
         WHERE dt = '"""+data_day_str+"""'
           AND jylx in ('1')) tmp
 GROUP BY xh, xfrq;
;
"""
hiveShell = """su hdfs -c \"hive -e \\\"""" + sql + """\\\"\""""
print(hiveShell)
os.system(hiveShell)