# -*-coding:utf-8-*-
import sys
import os
import datetime
sys.path.append( os.path.dirname(os.path.dirname(os.getcwd())))
from funcs.GetKeyByTime import getXNandXQByStr12

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
xn,xqm=getXNandXQByStr12(data_day_str)

data_newest_str="2999-12-31"

###########################################################
# 运行的时候将分区字段替换成  dt = '"""+data_day_str+"""' #
###########################################################

sql = """
set mapred.output.compress=true; 
set hive.exec.compress.output=true; 
set mapred.output.compression.codec=org.apache.hadoop.io.compress.SnappyCodec; 
set mapred.output.compression.type=block;

--  DESCRIPTION: ods->fdm 成绩基本信息表(fdm_kc_cjjbxx)    MODIFIED BY: mashaowei@h3c.com  2018-02-28                  
INSERT OVERWRITE TABLE fdm.fdm_kc_cjjbxx PARTITION (xn = '"""+xn+"""', xqm= '"""+xqm+"""')  SELECT
    NULL,
    A.xh,
    A.KCDM,
    NULL,
    NULL,
    NULL,
    NULL,
    A.BFZKSCJ,
    A.DJZKSCJ,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    B.BH,
    NULL,
    B.ZYDM,
    B.YXDM,
    NULL,
    A.xf,
    NULL,
    NULL,
    A.jd,
    NULL,
    NULL,
    NULL,
    NULL
FROM
    (
        SELECT
            XN,
            XQDM,
            XH,
            KCDM,
            BFZKSCJ,
            DJZKSCJ,
            XF,
            JD
        FROM
            ODS.ods_usr_gxsj_t_bzks_kscj WHERE  xn='"""+xn+"""' AND xqdm='"""+xqm+"""'
    ) A
LEFT JOIN (
    SELECT
        XH,
        BH,
        ZYDM,
        YXDM
    FROM
        ods.ods_usr_gxsj_T_BZKS WHERE dt = '"""+data_newest_str+"""'
) B ON A.xh = B.xh;

--  DESCRIPTION: ods->fdm 课程安排信息表(fdm_jw_pkap )    MODIFIED BY: mashaowei@h3c.com  2018-02-25
INSERT OVERWRITE TABLE fdm.fdm_jw_pkap  PARTITION (xn = '"""+xn+"""', xqm= '"""+xqm+"""')
SELECT
    A.JXBH,
    A.KCDM,
    B.KCKSDWH,
    A.XF,
    A.XS,
    A.KCLBDM,
    A.KCLBDM,
    B.KCXZ,
    B.KCXZ
FROM
    (
        SELECT
            KKXN,
            KKXQ,
            JXBH,
            KCDM,
            XF,
            XS,
            KCLBDM
        FROM
            ods.ods_usr_gxsj_T_JX_KCAP WHERE kkxn='"""+xn+"""' AND kkxq='"""+xqm+"""'
    ) A
LEFT JOIN (
    SELECT
        KCDM,
        KCKSDWH,
        KCXZ
    FROM
        ods.ods_usr_gxsj_T_BZKS_KC WHERE dt = '"""+data_newest_str+"""'
) B ON A.KCDM = B.KCDM;




"""
#hiveShell = 'hive -e "' + sql + '"'
hiveShell = """su hdfs -c \"hive -e \\\"""" + sql + """\\\"\""""
print(hiveShell)
os.system(hiveShell)
print('finish--')
