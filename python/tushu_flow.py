# -*-coding:utf-8-*-
import datetime
import os
import sys

today = datetime.date.today()
oneday = datetime.timedelta(days=1)
yesterday = today - oneday
print ("yesterday:", yesterday)


sql = """
set mapred.output.compress=true; 
set hive.exec.compress.output=true; 
set mapred.output.compression.codec=org.apache.hadoop.io.compress.SnappyCodec; 
set mapred.output.compression.type=block;

--  DESCRIPTION: ods->fdm 图书借阅记录表(fdm_ts_jyjl)
INSERT OVERWRITE TABLE fdm.fdm_ts_jyjl PARTITION (dt = '2017-02-02') 
SELECT
  a.tstm,
  b.tm,
  a.sfrzh,
  a.sfrzh,
  a.rq,
  NULL,
  c.dzxm,
  a.rq,
  NULL,
  NULL,
  NULL
FROM
  (
    SELECT
      sfrzh,
      tstm,
      czlx,
      rq
    FROM
      ods.ods_usr_gxsj_T_TS_JHSHU WHERE dt='2017-02-02' AND
    czlx = 'WJ'
  ) a
LEFT JOIN (SELECT tstm, tm FROM ods.ods_usr_gxsj_T_TS_TSXX) b ON a.TSTM = b.TSTM
LEFT JOIN ods.ods_usr_gxsj_t_ts_dz c ON a.sfrzh = c.sfrzh





"""
hiveShell = 'hive -e "' + sql + '"'
print(hiveShell)
os.system(hiveShell)
print('finish--')

# 疑问1、在考勤的sql文件中出现了签到的insert语句
# 疑问2、学生一卡通消费中没有insert插入语句
# 疑问3、insert前的set需要加入sql吗
# 疑问4、分区问题