# -*-coding:utf-8-*-
import datetime
import os
import sys

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

--  DESCRIPTION: ods->fdm 课程基本信息表(fdm_kc_jbxx)
INSERT OVERWRITE TABLE fdm.fdm_kc_jbxx PARTITION (dt = '"""+data_day_str+"""')  SELECT
    A.KCDM,
    A.KCMC,
    A.KCYWMC,
    A.XF,
    A.ZHXS,
    A.XS,
    NULL,
    B.SYXS,
    A.KCJJ,
    NULL,
    NULL,
    NULL,
    A.KCKSDWH,
    NULL,
    NULL
FROM
    (
        SELECT
            KCDM,
            KCMC,
            KCYWMC,
            XF,
            ZHXS,
            XS,
            KCJJ,
            KCKSDWH
        FROM
            ODS.ods_usr_gxsj_t_bzks_kc WHERE dt = '"""+data_day_str+"""'
    ) A
LEFT JOIN (
    SELECT
        SYXS,
        KCDM
    FROM
        ods.ods_usr_gxsj_T_BZKS_JXJH WHERE dt = '"""+data_day_str+"""'
) B ON A.KCDM = B.KCDM;



--  DESCRIPTION: ods->fdm 成绩基本信息表(fdm_kc_cjjbxx)    MODIFIED BY: mashaowei@h3c.com  2018-02-10                  
INSERT OVERWRITE TABLE fdm.fdm_kc_cjjbxx PARTITION (dt = '"""+data_day_str+"""')  SELECT
    A.xn,
    A.xqdm,
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
            ODS.ods_usr_gxsj_t_bzks_kscj WHERE dt = '"""+data_day_str+"""'
    ) A
LEFT JOIN (
    SELECT
        XH,
        BH,
        ZYDM,
        YXDM
    FROM
        ods.ods_usr_gxsj_T_BZKS WHERE dt = '"""+data_day_str+"""'
) B ON A.xh = B.xh;




--  DESCRIPTION: ods->fdm 选课信息表(fdm_kc_xsxkxx)    MODIFIED BY: mashaowei@h3c.com  2018-02-10
-- 选课信息 暂不需要                    
INSERT OVERWRITE TABLE fdm.fdm_kc_xsxkxx PARTITION (dt = '"""+data_day_str+"""')  SELECT
    B.kcdm,
    NULL,
    NULL,
    B.KKXN,
    B.jszgh,
    A.xh,
    NULL,
    NULL,
    B.KKXQ,
    NULL
FROM
    (
        SELECT
            xh,
            jxbh
        FROM
            ods.ods_usr_gxsj_t_bzks_xsxk WHERE dt = '"""+data_day_str+"""'
    ) A
LEFT JOIN (
    SELECT
        kcdm,
        jxbh,
        kkxn,
        KKXQ,
        jszgh  
    FROM
        ods.ods_usr_gxsj_T_JX_KCAP WHERE dt = '"""+data_day_str+"""'
) B ON A.jxbh = B.jxbh;



"""
#hiveShell = 'hive -e "' + sql + '"'
hiveShell = """su hdfs -c \"hive -e \\\"""" + sql + """\\\"\""""
print(hiveShell)
os.system(hiveShell)
print('finish--')
