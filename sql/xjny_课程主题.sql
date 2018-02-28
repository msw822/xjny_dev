 --  DESCRIPTION: ods->fdm 课程主题---- 
--     OPTIONS: ---
-- REQUIREMENTS: ---
--        BUGS: ---
--        NOTES: ---
--       AUTHOR: li.xiwang@h3c.com
--       MODIFIED BY: mashaowei@h3c.com
--     COMPANY: h3c.bigdata
--      VERSION: 1.0
--     CREATED: 2018/02/08
--    REVIEWER:
--    REVISION:

SET mapred.output.compress = true;
SET hive.exec.compress.output = true;
SET mapred.output.compression.codec = org.apache.hadoop.io.compress.SnappyCodec;
SET mapred.output.compression.type = block;

--  DESCRIPTION: ods->fdm 课程基本信息表(fdm_kc_jbxx)
INSERT OVERWRITE TABLE fdm.fdm_kc_jbxx PARTITION (dt = '2999-12-31') SELECT
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
            ODS.ods_usr_gxsj_t_bzks_kc
    ) A
LEFT JOIN (
    SELECT
        SYXS,
        KCDM
    FROM
        ods.ods_usr_gxsj_T_BZKS_JXJH
) B ON A.KCDM = B.KCDM;



--  DESCRIPTION: ods->fdm 成绩基本信息表(fdm_kc_cjjbxx)    MODIFIED BY: mashaowei@h3c.com  2018-02-10                  
INSERT OVERWRITE TABLE fdm.fdm_kc_cjjbxx PARTITION (dt = '2999-12-31') SELECT
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
            ODS.ods_usr_gxsj_t_bzks_kscj
    ) A
LEFT JOIN (
    SELECT
        XH,
        BH,
        ZYDM,
        YXDM
    FROM
        ods.ods_usr_gxsj_T_BZKS
) B ON A.xh = B.xh;



--  DESCRIPTION: ods->fdm 课程安排信息表(fdm_jw_pkap)
--教务课程安排信息
INSERT OVERWRITE TABLE fdm.fdm_jw_pkap PARTITION (dt = '2999-12-31') 
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
            ods.ods_usr_gxsj_T_JX_KCAP WHERE dt = '2999-12-31'
    ) A
LEFT JOIN (
    SELECT
        KCDM,
        KCKSDWH,
        KCXZ
    FROM
        ods.ods_usr_gxsj_T_BZKS_KC WHERE dt = '2999-12-31'
) B ON A.KCDM = B.KCDM


--  DESCRIPTION: ods->fdm 选课信息表(fdm_kc_xsxkxx)    MODIFIED BY: mashaowei@h3c.com  2018-02-10
-- 选课信息 暂不需要                    
INSERT OVERWRITE TABLE fdm.fdm_kc_xsxkxx PARTITION (dt = '2999-12-31') SELECT
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
            ods.ods_usr_gxsj_t_bzks_xsxk
    ) A
LEFT JOIN (
    SELECT
        kcdm,
        jxbh,
        kkxn,
        KKXQ,
        jszgh  
    FROM
        ods.ods_usr_gxsj_T_JX_KCAP
) B ON A.jxbh = B.jxbh



