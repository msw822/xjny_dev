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

--  DESCRIPTION: ods->fdm 成绩基本信息表(fdm_kc_cjjbxx)    MODIFIED BY: mashaowei@h3c.com  2018-02-28                  
INSERT OVERWRITE TABLE fdm.fdm_kc_cjjbxx PARTITION (
    xn = '"""+xn+"""',
    xqm = '"""+xqm+"""'
) SELECT
    NULL,
    A.xh,
    A.KCDM,
    NULL,
    NULL,
    NULL,
    NULL,
    A.BFZKSCJ,
    A.DJZKSCJ,
    A.KCCJ_JG,
    A.KCCJ_JG,
    A.KCCJ_JG,
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
            CASE
        WHEN BFZKSCJ <= '99.9'
        OR BFZKSCJ IN ('100', '100.0') THEN
            BFZKSCJ
        WHEN BKCJ IS NOT NULL THEN
            BKCJ
        WHEN DJZKSCJ IN ('优秀', 'A') THEN
            '90'
        WHEN DJZKSCJ IN ('良好', '良', 'B') THEN
            '80'
        WHEN DJZKSCJ IN ('中等', '通过', 'C') THEN
            '70'
        WHEN DJZKSCJ IN ('合格', 'D') THEN
            '60'
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
    JD
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
