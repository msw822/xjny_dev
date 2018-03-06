#!/usr/bin/env python3
#===============================================================================
#
#         FILE: hive2local_jd_zw_gdt_zhitou.py
#
#        USAGE: ./hive2local_jd_zw_gdt_zhitou.py
#
#  DESCRIPTION: 
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: li.zhanlei@h3c.com
#      COMPANY:  bigdata.h3c.com
#      VERSION: 1.0
#      CREATED: 2018/03/05
#     REVIEWER:
#     REVISION: ---
#    SRC_TABLE:
#    TGT_TABLE: 
#===============================================================================
import sys
import os
import datetime

sys.path.append(os.getenv('HIVE_TASK'))
if(len(sys.argv)>1):
    data_day_str = sys.argv[1]
    yesterday = str(sys.argv[1])
    if len(yesterday) == 8:
        data_day_str = yesterday[0:4]+'-'+yesterday[4:6]+'-'+yesterday[6:8]
else:
    data_day_str = ht.data_day_str
    if len(data_day_str) == 8:
        data_day_str = yesterday[0:4]+'-'+yesterday[4:6]+'-'+yesterday[6:8]

data_day_int = (datetime.datetime.strptime(data_day_str, '%Y-%m-%d')).strftime('%Y%m%d')

filePath = "/data0/jd_ad/schedule/data/jd_zw_gdt_zhitou/" + data_day_str
sql = """
INSERT OVERWRITE LOCAL DIRECTORY '""" + filePath + """'
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
SELECT """ + data_day_int + """,
       category_key,
       sum(adv_order_count),
       round(sum(adv_order_price)/100, 2),
       sum(adv_valid_order_count),
       round(sum(adv_valid_order_price)/100, 2),
       sum(adv_order_count_pla),
  from (SELECT /*+ mapjoin(c)*/
         
 group by category_key
;
"""
hiveShell ='hive -e "'+sql+'"'
print(hiveShell)
os.system(hiveShell)
if os.path.exists(filePath+"/000000_0") and os.path.getsize(filePath+"/000000_0") > 0:
    deleteShell = """mysql -h172.17.8.115  -P3358 -uads_data -pads@data -e "delete from ads_report.daily_gdt_data where date="""+data_day_int+""" " """
    mysqlShell = """mysql -h172.17.8.115  -P3358 -uads_data -pads@data --local-infile=1 -e "LOAD DATA LOCAL INFILE '"""+filePath+"""/000000_0' into table ads_report.daily_gdt_data(date, category_key,adv_order_count,adv_order_price, adv_valid_order_count,adv_valid_order_price, plat_order_count, plat_order_price,  plat_valid_order_count, plat_valid_order_price, adv_oneday_order_count, adv_oneday_order_price, plat_oneday_order_count, plat_oneday_order_price, adv_oneday_valid_order_count, adv_oneday_valid_order_price, plat_oneday_valid_order_count, plat_oneday_valid_order_price)" """
    monitorShell = """mysql -h172.17.8.115 -P3358 -uads_data -pads@data -e "insert into ads_report.daily_report_data_monitor(date,table_name,complete_flag,create_time) values("""+data_day_int+""",'daily_gdt_data',1,now()) " """
    os.system(deleteShell)
    os.system(mysqlShell)
    os.system(monitorShell)
else:
    raise Exception("data error")
print('finish--')
