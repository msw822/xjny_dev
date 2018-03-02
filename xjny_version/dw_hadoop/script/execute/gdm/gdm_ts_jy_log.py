# -*- coding:utf-8-*-
# requirement:gdm_xs_jbxx_da
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
INSERT OVERWRITE TABLE gdm.gdm_ts_jy_log PARTITION (dt='"""+data_day_str+"""')
SELECT /*+ mapjoin(C)*/
 A.TSTM,
 A.TSMC,
 A.DZTM,
 A.SFRZH,
 B.XH,
 D.XM,
 D.XBM,
 D.XBM_MC,
 D.RXNY,
 D.SZNJ,
 D.SZBH,
 D.BJMC,
 D.ZYM,
 D.ZYM_MC,
 D.SSYXM,
 D.SSYXM_MC,
 D.PYCCM,
 D.PYCCM_MC,
 D.SFZJH,
 D.CSRQ,
 A.JSRQ,
 A.YHRQ,
 A.DZXM,
 A.WJSJ,
 A.XJCS,
 A.CSBM,
 A.CSMC,
 C.DM,
 C.MC
  FROM (SELECT TSTM,
               TSMC,
               DZTM,
               SFRZH,
               JSRQ,
               YHRQ,
               DZXM,
               WJSJ,
               XJCS,
               CSBM,
               CSMC
          FROM FDM.fdm_ts_jy_log
         WHERE dt = '"""+data_day_str+"""') A
  LEFT OUTER JOIN (SELECT XH, DZTM
                     FROM FDM.FDM_TS_DZXX
                    WHERE dt = '"""+data_newest_str+"""') B
    ON A.DZTM = B.DZTM
  LEFT OUTER JOIN (select * from DIM.hb_tslb) C
    ON subSTR(A.TSTM, 1, 1) = c.dm
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
                          CSRQ
                     FROM GDM.gdm_xs_jbxx_da
                    WHERE dt = '"""+data_newest_str+"""') D
    ON B.XH = D.XH;
"""
hiveShell = """su hdfs -c \"hive -e \\\"""" + sql + """\\\"\""""
print(hiveShell)
os.system(hiveShell)
