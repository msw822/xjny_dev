# -*-coding:utf-8-*-

import os
import sys
import datetime

#获取外部日期参数，如果传参则data_day_str为传递的参数，如果未传参data_day_str为昨天的日期
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

###########################################################
# 运行的时候将分区字段替换成  dt = '"""+data_day_str+"""' #
###########################################################

sql = """
set mapred.output.compress=true; 
set hive.exec.compress.output=true; 
set mapred.output.compression.codec=org.apache.hadoop.io.compress.SnappyCodec; 
set mapred.output.compression.type=block;



----  DESCRIPTION: ods->fdm 学生基本信息表(edu_fdm_xs_jbxx)
INSERT OVERWRITE TABLE fdm.fdm_xs_jbxx PARTITION (dt = '2999-12-31') SELECT
xh,
xm,
xmpy,
xmpy,
cym,
xbdm,
csrq,
jgdm,
jgdm,
mzdm,
gjdqdm,
sfzjlxm,
sfzjh,
hyzkdm,
gatqdm,
zzmmdm,
jkzkdm,
NULL,
xxdm,
NULL,
NULL,
NULL,
NULL,
NULL,
from_unixtime(
unix_timestamp(),
'yyyy-MM-dd'
)
FROM
ods.ods_usr_gxsj_t_bzks;



--  DESCRIPTION: ods->fdm 学籍信息表(edu_fdm_xs_xjxx)
INSERT OVERWRITE TABLE fdm.fdm_xs_xjxx PARTITION (dt = '2999-12-31') SELECT
xh,
rxny,
xslbdm,
xz,
zydm,
bh,
xznj,
NULL,
yxdm,
NULL,
NULL,
NULL,
NULL,
NULL,
NULL,
NULL,
NULL,
NULL,
from_unixtime(
unix_timestamp(),
'yyyy-MM-dd'
)
FROM
ods.ods_usr_gxsj_t_bzks;



--  DESCRIPTION: ods->fdm 学生来源信息表(edu_fdm_xs_lyxx)
INSERT OVERWRITE TABLE fdm.fdm_xs_lyxx PARTITION (dt = '2999-12-31') 
SELECT
xh,
byzx,
NULL,
NULL,
syddm,
NULL,
NULL,
gjdqdm,
syddm,
NULL,
NULL,
NULL
FROM
ods.ods_usr_gxsj_t_bzks_gk;


"""
#hiveShell = 'hive -e "' + sql + '"'
hiveShell = """su hdfs -c \"hive -e \\\"""" + sql + """\\\"\""""
print(hiveShell)
os.system(hiveShell)
print('finish--')

# 疑问1、在考勤的sql文件中出现了签到的insert语句
# 疑问2、学生一卡通消费中没有insert插入语句
# 疑问3、insert前的set需要加入sql吗
# 疑问4、分区问题