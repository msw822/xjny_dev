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



--  DESCRIPTION: ods->fdm 课程安排信息表(fdm_jw_pkap )    MODIFIED BY: mashaowei@h3c.com  2018-02-25
INSERT OVERWRITE TABLE fdm.fdm_jw_pkap  PARTITION (xn = '"""+xn+"""', xqm= '"""+xqm+"""')
SELECT
    A.JXBH,
    A.KCDM,
    A.KCMC,
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
            KCMC,
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




--  DESCRIPTION: ods->fdm 成绩基本信息表(fdm_kc_cjjbxx)    MODIFIED BY: mashaowei@h3c.com  2018-02-28                  
INSERT OVERWRITE TABLE fdm.fdm_kc_cjjbxx PARTITION (
    xn = '"""+xn+"""',
    xqm = '"""+xqm+"""'
) SELECT
    NULL,
    A.xh,
    A.kcdm,
    NULL,
    NULL,
    KSXZM,
    NULL,
    A.BFZKSCJ,
    A.DJZKSCJ,
    A.KCCJ,
    A.ZSCJ,
    A.KCCJ_JG,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    B.BH,
    A.xkkch,
    B.ZYDM,
    B.YXDM,
    NULL,
    A.xf,
    A.xf_hd,
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
            
        CASE WHEN  BFZKSCJ <= '99.9'
        OR BFZKSCJ IN ('100', '100.0') THEN
            BFZKSCJ
        WHEN DJZKSCJ IS NOT NULL THEN
            DJZKSCJ 
        END AS KCCJ,
        
        CASE
        WHEN BFZKSCJ <= '99.9'
        OR BFZKSCJ IN ('100', '100.0') THEN
            BFZKSCJ
        WHEN DJZKSCJ IN ('优秀', 'A') THEN
            '95'
        WHEN DJZKSCJ IN ('良好', '良', 'B') THEN
            '85'
        WHEN DJZKSCJ IN ('中等', 'C') THEN
            '75'
        WHEN DJZKSCJ IN ('合格', 'D') THEN
            '65'
        WHEN DJZKSCJ IN ('E','不合格') THEN
            '50'
        ELSE
            '0'
        END AS  ZSCJ, 

        
            CASE
        WHEN BKCJ <= '99.9' OR BKCJ IN ('100', '100.0') THEN
            BKCJ 
        WHEN  
        BKCJ IN ('优秀', 'A') THEN
            '95'  
        WHEN   
        BKCJ IN ('良好', '良', 'B') THEN
            '85'
        WHEN BKCJ IN ('中等', 'C') THEN
            '75'
        WHEN BKCJ IN ('合格', 'D') THEN
            '65'
        WHEN BKCJ IN ('E','不合格') THEN
            '50'
        WHEN BKCJ IN ('缺考') THEN
            BFZKSCJ   
        WHEN BFZKSCJ <= '99.9'
        OR BFZKSCJ IN ('100', '100.0') THEN
            BFZKSCJ
        WHEN DJZKSCJ IN ('优秀', 'A') THEN
            '95'
        WHEN DJZKSCJ IN ('良好', '良', 'B') THEN
            '85'
        WHEN DJZKSCJ IN ('中等', 'C') THEN
            '75'
        WHEN DJZKSCJ IN ('合格', 'D') THEN
            '65'
        WHEN DJZKSCJ IN ('E','不合格') THEN
            '50'
        ELSE
            '0'
        END AS KCCJ_JG,
        DJZKSCJ,
        XF,
        CASE
    WHEN SFTG = '是' THEN
        XF
    ELSE
        '0'
    END AS XF_HD,
    JD,xkkch,           
    CASE WHEN BKCJ IS NOT NULL THEN '11' 
    ELSE '01'  END AS KSXZM
FROM
    ODS.ods_usr_gxsj_t_bzks_kscj
WHERE
    xn = '"""+xn+"""'
AND xqdm = '"""+xqm+"""'
    ) A
LEFT JOIN (
    SELECT
        XH,
        BH,
        ZYDM,
        YXDM
    FROM
        ods.ods_usr_gxsj_T_BZKS
    WHERE
        dt = '"""+data_newest_str+"""'
) B ON A.xh = B.xh;

"""
#hiveShell = 'hive -e "' + sql + '"'
hiveShell = """su hdfs -c \"hive -e \\\"""" + sql + """\\\"\""""
print(hiveShell)
os.system(hiveShell)
print('finish--')

