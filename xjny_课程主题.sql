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



--  DESCRIPTION: ods->fdm 排课信息表(edu_fdm_kc_pk)



--  DESCRIPTION: ods->fdm 选课信息表(fdm_kc_xsxkxx)                      
INSERT OVERWRITE TABLE fdm.fdm_kc_xsxkxx PARTITION (dt = '2999-12-31') SELECT
    kch,
    NULL,
    jxbh,
    b.KKXN,
    c.zdlszgh,
    xh,
    NULL,
    NULL,
    b.KKXQ,
    NULL
FROM
    (
        SELECT
            kch,
            jxbh,
            xh,
            wid
        FROM
            ods.ods_usr_gxsj_t_bzks_xsxk
    ) A
LEFT JOIN (
    SELECT
        wid,
        kkxn,
        KKXQ
    FROM
        ods.ods_usr_gxsj_T_JX_KCAP
) B ON A.wid = B.wid
LEFT JOIN (
    SELECT
        wid,
        zdlszgh
    FROM
        ods.ods_usr_gxsj_T_BZKS_PKXX_BST
) c ON A.wid = c.wid
