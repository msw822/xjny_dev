#!/usr/bin/env python
# -*- coding:utf-8-*-
#===============================================================================
#
#         FILE: edu_app_yskns_lhb.py
#
#        USAGE: ./edu_app_yskns_lhb.py
#
#  DESCRIPTION:疑似家庭困难生量化计算。此脚本不是最终的，需要修改
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: li.zhanlei@h3c.com
#      COMPANY: bigdata.h3c.com
#      VERSION: 1.0
#      CREATED: 2018/02/26
#     REVIEWER: li.zhanlei
#     REVISION: ---
#    SRC_TABLE:
#    TGT_TABLE: edu_app_yskns_lhb
#===============================================================================
import sys
import os
import datetime

sys.path.append(os.path.dirname(os.path.dirname(os.getcwd())))
#from funcs.GetKeyByTime import getXNandXQByStr12

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
INSERT OVERWRITE TABLE app.edu_app_yskns_lhb PARTITION(dt='"""+data_newest_str+"""')
select xsxx.xh        as xh,
       xsxx.xm        as xm,
       xsxx.ssyxm     as yxdm,
       xsxx.ssyxm_mc  as yxmc,
       zym            as zydm,
       zym_mc         as zymc,
       szbh           as bjdm,
       bjmc           as bjmc,
       sznj           as xznj,     
       null           as FQSFCJ,
       null           as FQSFSW,
       null           as MQSFCJ,
       null           as MQSFSW,
       null           as JTNZSR,
       null           as ZXDKZJE,
       null           as QJXFJE,
       null           as SFPK_ZP,
       null           as SFPK_FDY,
       qxxf.qx_jccs as QX_YJJCCS,
       grxf.grjccs    as YJJCCS,
       qxxf.qx_xf as QX_YJXF,
       grxf.grxf    as YJXF,
       qxxf.qx_jcxf   as QX_CJXF,
       grxf.grjcxf      as CJXF,
       null           as QGJXCS
  from (select * from gdm.gdm_xs_jbxx_da where xh like '22%') xsxx
  left join
  (select xh,sum(xfje)/(count(distinct jyje_day)/30) grxf,sum(jcje)/count(1) grjcxf,count(1)/count(distinct jyje_day)*30 grjccs from
  (select xh,
       sum(jyje) xfje,
       sum(case when shlbmc in ('餐厅消费') then jyje else 0 end) jcje,
       case when SUBSTR(jysj, 12, 2) >= '06' and SUBSTR(jysj, 12, 2) < '12'
         then 'ZC'
        when SUBSTR(jysj, 12, 2) >= '12' and SUBSTR(jysj, 12, 2) < '16'
         then 'ZWC'
        when SUBSTR(jysj, 12, 2) >= '16' and SUBSTR(jysj, 12, 2) < '24'
         then 'WC'
       end as jclx,
       dt as jyje_day
          from gdm.gdm_ykt_jy_log
         WHERE jylx in ('消费')
       and xh like '22%'
       group by xh,dt,
       case when SUBSTR(jysj, 12, 2) >= '06' and SUBSTR(jysj, 12, 2) < '12'
         then 'ZC'
        when SUBSTR(jysj, 12, 2) >= '12' and SUBSTR(jysj, 12, 2) < '16'
         then 'ZWC'
        when SUBSTR(jysj, 12, 2) >= '16' and SUBSTR(jysj, 12, 2) < '24'
         then 'WC'
       end) abc
       group by xh) grxf
      on (xsxx.xh=grxf.xh)     
       full outer join
      (select sum(qx_xf)/count(distinct xh) qx_xf,sum(qx_jcxf)/count(distinct xh) qx_jcxf,sum(gr_jccs)/count(distinct xh) qx_jccs from
	 (select xh,sum(xfje)/(count(distinct jyje_day)/30) qx_xf,sum(jcje)/count(1) qx_jcxf,
	  count(1)/count(distinct jyje_day)*30 gr_jccs 
	  from
     (select xh,
       sum(jyje) xfje,
       sum(case when shlbmc in ('餐厅消费') then jyje else 0 end) jcje,
       case when SUBSTR(jysj, 12, 2) >= '06' and SUBSTR(jysj, 12, 2) < '12'
         then 'ZC'
        when SUBSTR(jysj, 12, 2) >= '12' and SUBSTR(jysj, 12, 2) < '16'
         then 'ZWC'
        when SUBSTR(jysj, 12, 2) >= '16' and SUBSTR(jysj, 12, 2) < '24'
         then 'WC'
       end as jclx,
       dt as jyje_day
          from gdm.gdm_ykt_jy_log
         WHERE jylx in ('消费')
       and xh like '22%'
       group by xh,dt,case when SUBSTR(jysj, 12, 2) >= '06' and SUBSTR(jysj, 12, 2) < '12'
         then 'ZC'
        when SUBSTR(jysj, 12, 2) >= '12' and SUBSTR(jysj, 12, 2) < '16'
         then 'ZWC'
        when SUBSTR(jysj, 12, 2) >= '16' and SUBSTR(jysj, 12, 2) < '24'
         then 'WC'
       end) abcd
	   group by xh) tmp
       )	qxxf
     on 1=1;
"""
hiveShell = """su hdfs -c \"hive -e \\\"""" + sql + """\\\"\""""
print(hiveShell)
os.system(hiveShell)

