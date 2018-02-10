--  DESCRIPTION: ods->fdm 流水表---- 一卡通交易、门禁记录、图书借阅记录
--     OPTIONS: ---
-- REQUIREMENTS: ---
--        BUGS: ---
--        NOTES: ---
--       AUTHOR: mashaowei@h3c.com li.xiwang@h3c.com
--     COMPANY: h3c.bigdata
--      VERSION: 1.0
--     CREATED: 2018/02/09
--    REVIEWER:
--    REVISION:

SET mapred.output.compress = true;
SET hive.exec.compress.output = true;
SET mapred.output.compression.codec = org.apache.hadoop.io.compress.SnappyCodec;
SET mapred.output.compression.type = block;


set hive.exec.dynamic.partition.mode=nonstrict;

--  DESCRIPTION: ods->fdm 一卡通交易信息表(fdm_ykt_jy) 动态分区     
INSERT OVERWRITE TABLE fdm.fdm_ykt_jy PARTITION (dt) SELECT
    a.kh,
    NULL,
    b.xh,
    NULL,
    A.XFJE,
    NULL,
    A.XFRQ,
    a.xfrqsj,
    C.SHMC,
    c.shid,
    c.shmc,
    a.xfsbbh,
    NULL,
    a.xfye,
    a.dt
FROM
    (
        SELECT
            kh,
            xfje,
            xfrq,
            xfrqsj,
            xfsbbh,
            xfye,
            xfdwid,
            dt
        FROM
            ods.ods_usr_gxsj_t_ykt_xfjl
    ) A
LEFT JOIN (
    SELECT
        kh,
        xh
    FROM
        ods.ods_usr_gxsj_t_ykt_KH
) B ON A.KH = B.kh
LEFT JOIN (
    SELECT
        shmc,
        shid,
        xfsbid,
        xfdwid
    FROM
        ods.ods_usr_gxsj_t_ykt_xfsbbh
) c ON (
    CAST(
        CAST(C.xfsbid AS INT) AS string
    )
) = a.xfsbbh
AND (
    CAST(
        CAST(c.xfdwid AS INT) AS string
    )
) = a.xfdwid;






--  DESCRIPTION: ods->fdm 一宿舍门禁记录表(fdm_bks_mj) 动态分区 
INSERT OVERWRITE TABLE fdm.fdm_bks_mj PARTITION (dt) SELECT
    a.num,
    b.xm,
    NULL,
    b.bh,
    a.inoutdate,
    NULL,
    (
        CASE
        WHEN a.direction == '入'
        OR a.direction == '无入'
        OR a.direction == '反入' THEN
            '1'
        ELSE
            '2'
        END
    ),
    NULL,
    NULL,
    a.dt
FROM
    (
        SELECT
            num,
            inoutdate,
            direction,
            dt
        FROM
            ods.ods_usr_gxsj_t_xscrxx
    ) a
LEFT JOIN (
    SELECT
        xh,
        xm,
        bh
    FROM
        ods.ods_usr_gxsj_t_bzks
) b ON a.num = b.xh







--  DESCRIPTION: ods->fdm 图书借阅记录表(fdm_ts_jyjl) 动态分区 
INSERT OVERWRITE TABLE fdm.fdm_ts_jyjl PARTITION (dt) SELECT
    a.tstm,
    b.tm,
    a.sfrzh,
    a.sfrzh,
    a.rq,
    NULL,
    c.dzxm,
    a.rq,
    NULL,
    NULL,
    NULL,
    a.dt
FROM
    (
        SELECT
            sfrzh,
            tstm,
            czlx,
            rq,
            dt
        FROM
            ods.ods_usr_gxsj_T_TS_JHSHU
        WHERE
            czlx = 'WJ' AND dt>='2014-01-01'  AND dt<='2015-01-01'
    ) a
LEFT JOIN (
    SELECT
        tstm,
        tm
    FROM
        ods.ods_usr_gxsj_T_TS_TSXX
) b ON a.TSTM = b.TSTM
LEFT JOIN ods.ods_usr_gxsj_t_ts_dz c ON a.sfrzh = c.sfrzh