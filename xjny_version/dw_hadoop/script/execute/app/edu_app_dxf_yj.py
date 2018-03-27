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
#
# 9,10,11,12,1 第一学期;2，3，4，5，6，7 第二学期
# 其中8月份放假，暂且放入第一学期。因为大部分学校都选在8月底开学
# 经和校方沟通：第一学期一般九月初开学，一月中旬放假，第二学期二月底开学，七月中旬放假
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
        
year = int(data_day_str[0:4])
month = int(data_day_str[5:7])

if month>=2 and month<8:
    data_day_str_from= str(year-1)+"-09-01"
    data_day_str_to= str(year)+"-01-31"
    
    
elif month>=8:
    data_day_str_from= str(year)+"-03-01"
    data_day_str_to= str(year)+"-07-31"

else:
    data_day_str_from= str(year-1)+"-09-01"
    data_day_str_to= str(year)+"-01-31"

data_newest_str="2999-12-31"
sql = """
set mapred.output.compress=true;
set hive.exec.compress.output=true;
set mapred.output.compression.codec=org.apache.hadoop.io.compress.SnappyCodec;
set mapred.output.compression.type=block;

INSERT OVERWRITE TABLE app.edu_app_dxf_yj PARTITION (dt='"""+data_newest_str+"""')
select xh,xm,ssyxm,ssyxm_mc,zym,zym_mc,szbh,bjmc,sznj,sum(jyje)/count(distinct substr(jyje_day,6,2)),sum(jyje)/count(1)
from
(select xh,
       xm,
       ssyxm,
       ssyxm_mc,
       zym,
       zym_mc,
       szbh,
       bjmc,
       sznj,
       sum(jyje) jyje,
	   case when SUBSTR(jysj, 12, 2) >= '06' and SUBSTR(jysj, 12, 2) < '12'
	     then 'ZC'
	    when SUBSTR(jysj, 12, 2) >= '12' and SUBSTR(jysj, 12, 2) < '16'
	     then 'ZWC'
	    when SUBSTR(jysj, 12, 2) >= '16' and SUBSTR(jysj, 12, 2) < '24'
	     then 'WC'
	   end as jclx,
	   dt as jyje_day
          from gdm.gdm_ykt_jy_log
         WHERE shlbmc in ('餐厅消费')
	   and dt >='"""+data_day_str_from+"""'
	   and dt <='"""+data_day_str_to+"""'
		 and jylx in ('消费')
	   and xh like '22%'
	   group by
	   xh,
       xm,
       ssyxm,
       ssyxm_mc,
       zym,
       zym_mc,
       szbh,
       bjmc,
       sznj,
	   case when SUBSTR(jysj, 12, 2) >= '06' and SUBSTR(jysj, 12, 2) < '12'
	     then 'ZC'
	    when SUBSTR(jysj, 12, 2) >= '12' and SUBSTR(jysj, 12, 2) < '16'
	     then 'ZWC'
	    when SUBSTR(jysj, 12, 2) >= '16' and SUBSTR(jysj, 12, 2) < '24'
	     then 'WC'
	   end,
	   dt) ykt
	group by xh,xm,ssyxm,ssyxm_mc,zym,zym_mc,szbh,bjmc,sznj
"""
hiveShell = """su hdfs -c \"hive -e \\\"""" + sql + """\\\"\""""
print(hiveShell)
os.system(hiveShell)