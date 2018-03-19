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

--  DESCRIPTION: ods->fdm 一卡通交易信息表(fdm_ykt_jy_log) 动态分区     20160101开始 
INSERT OVERWRITE TABLE fdm.fdm_ykt_jy_log PARTITION (dt) 
SELECT
a.kh,
NULL,
b.xh,
A.JYLX,
A.XFJE,
A.XFMXID,
A.XFRQ,
a.xfsj,
C.SHMC,
c.shid,
c.shmc,
a.xfsbbh,
NULL,
a.xfye 
FROM
( SELECT XFMXID,kh,xfje,SUBSTR(XFRQ, 1, 10) AS XFRQ ,regexp_replace(xfrqsj, '/', '-') as xfsj ,xfsbbh,xfye,xfdwid,
CASE WHEN xfje<0 THEN '消费' ELSE '充值'  END AS JYLX  
dt FROM ods.ods_usr_gxsj_t_ykt_xfjl  WHERE dt>='2018-01-01'  AND dt<='2018-06-01' ) A
LEFT OUTER JOIN ( SELECT kh,xh FROM ods.ods_usr_gxsj_t_ykt_KH WHERE dt = '2999-12-31'  ) B ON A.KH = B.kh
LEFT OUTER JOIN 

( SELECT (
CAST ( CAST (xfsbid AS int ) AS string )) as xfsbid, 
(CAST ( CAST (xfdwid AS int ) AS string )) as xfdwid,
MAX(shmc) AS shmc,MAX(shid) AS shid FROM ods.ods_usr_gxsj_t_ykt_xfsbbh WHERE dt = '2999-12-31'  group by xfdwid,xfsbid ) c ON 
 c.xfsbid = a.xfsbbh 
AND  c.xfdwid = a.xfdwid;






--  DESCRIPTION: ods->fdm 一宿舍门禁记录表(fdm_bks_mj) 动态分区 
set hive.exec.dynamic.partition.mode=nonstrict;
INSERT OVERWRITE TABLE fdm.fdm_xs_mj_log PARTITION (dt) 
SELECT
   a.num,
   b.xm,
   NULL,
   b.bh,
   a.inoutdate,
   NULL,
   (case when a.direction=='入' or a.direction=='无入'  or a.direction=='反入' or a.direction=='潜入'  then '进' else '出' end),
   NULL,
   NULL,a.dt FROM (
      SELECT
        num,
        inoutdate,
        direction,
        dt
      FROM ods.ods_usr_gxsj_t_xscrxx WHERE  dt>='2017-06-01'  AND dt<='2018-04-01'
   ) a
LEFT JOIN (SELECT xh, xm,bh FROM ods.ods_usr_gxsj_t_bzks WHERE dt = '2999-12-31') b ON a.num = b.xh;






--  DESCRIPTION: ods->fdm 图书借阅记录表(fdm_ts_jyjl) 动态分区 
INSERT OVERWRITE TABLE fdm.fdm_ts_jy_log PARTITION (dt) SELECT
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
            czlx = 'WJ' AND dt>='2018-01-01'  AND dt<='2018-04-01'
    ) a
LEFT JOIN (
    SELECT
        tstm,
        tm
    FROM
        ods.ods_usr_gxsj_T_TS_TSXX
) b ON a.TSTM = b.TSTM
LEFT JOIN (SELECT sfrzh,dzxm FROM ods.ods_usr_gxsj_t_ts_dz WHERE dt = '2999-12-31')  c ON a.sfrzh = c.sfrzh