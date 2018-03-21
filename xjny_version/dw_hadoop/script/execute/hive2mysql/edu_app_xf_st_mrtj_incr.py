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
    today=datetime.date.today()
    oneday=datetime.timedelta(days=1)
    yesterday=today-oneday
    print 'yesterday:',yesterday
    data_day_str=str(yesterday)
    if len(data_day_str) == 8:
        data_day_str = yesterday[0:4]+'-'+yesterday[4:6]+'-'+yesterday[6:8]

data_day_int = (datetime.datetime.strptime(data_day_str, '%Y-%m-%d')).strftime('%Y%m%d')

filePath = "/tmp/xjny_daily/edu_app_xf_st_mrtj/data" + data_day_str
data_day_str1 = "\'"+data_day_str+"\'"
sql = """
INSERT OVERWRITE LOCAL DIRECTORY '""" + filePath + """'
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
SELECT rq,xfze,rjxfe,dt FROM app.edu_app_xf_st_mrtj WHERE dt=""" + data_day_str1 + """
;
"""

hiveShell = """su hdfs -c \"hive -e \\\"""" + sql + """\\\"\""""
print(hiveShell)
os.system(hiveShell)
if os.path.exists(filePath+"/000000_0") and os.path.getsize(filePath+"/000000_0") > 0:
    deleteShell = """mysql -h10.5.1.21  -P3306 -uroot -p123456 -e "delete from app.edu_app_xf_st_mrtj where dt="""+data_day_str1+""" " """
    mysqlShell = """  mysql -h10.5.1.21  -P3306 -uroot -p123456 --local-infile=1 -e " SET NAMES utf8; LOAD DATA LOCAL INFILE '"""+filePath+"""/000000_0' into table app.edu_app_xf_st_mrtj(rq,xfze,rjxfe,dt)  " """
    monitorShell = """mysql -h10.5.1.21 -P3306 -uroot -p123456 -e "insert into app.daily_report_data_monitor(date,table_name,complete_flag,create_time) values("""+data_day_int+""",'edu_app_xf_st_mrtj',1,now()) " """
    os.system(deleteShell)
    os.system(mysqlShell)
    os.system(monitorShell)
else:
    raise Exception("data error not found not 000000_0 at " +filePath)
print('finish--')
