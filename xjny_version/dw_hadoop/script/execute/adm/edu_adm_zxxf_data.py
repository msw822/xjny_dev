# -*-coding:utf-8-*-
#  在消费地点消费金额
import os
import sys

if len(sys.argv) > 1:
    data_day_str = sys.argv[1]
    yesterday = str(sys.argv[1])
    if len(yesterday) == 8:
        data_day_str = yesterday[0:4] + '-' + yesterday[4:6] + '-' + yesterday[6:8]
else:
    today = datetime.date.today()
    oneday = datetime.timedelta(days=1)
    yesterday = today - oneday
    print 'yesterday:', yesterday
    data_day_str = str(yesterday)
    if len(data_day_str) == 8:
        data_day_str = yesterday[0:4] + '-' + yesterday[4:6] + '-' + yesterday[6:8]
sql = """
set mapred.output.compress=true; 
set hive.exec.compress.output=true; 
set mapred.output.compression.codec=org.apache.hadoop.io.compress.SnappyCodec; 
set mapred.output.compression.type=block;
INSERT OVERWRITE TABLE adm.edu_adm_zxxf_data PARTITION (dt='""" + data_day_str + """')
SELECT xh, shmc, round(SUM(jyje),2) as xfje FROM gdm.edu_gdm_ykt_jy_da WHERE dt = '""" + data_day_str + """'
GROUP BY xh, shmc
ORDER BY XH
"""
hiveShell = 'hive -e "' + sql + '"'
print(hiveShell)
os.system(hiveShell)
print('finish--')
