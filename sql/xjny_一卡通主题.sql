--  DESCRIPTION: ods->fdm 一卡通主题---- 
--     OPTIONS: ---
-- REQUIREMENTS: ---
--        BUGS: ---
--        NOTES: ---
--       AUTHOR: li.xiwang@h3c.com
--     COMPANY: h3c.bigdata
--      VERSION: 1.0
--     CREATED: 2018/02/08
--    REVIEWER:
--    REVISION:

SET mapred.output.compress = true;
SET hive.exec.compress.output = true;
SET mapred.output.compression.codec = org.apache.hadoop.io.compress.SnappyCodec;
SET mapred.output.compression.type = block;

--  DESCRIPTION: ods->fdm 一卡通账户信息表(fdm_ykt_xx)
INSERT OVERWRITE TABLE fdm.fdm_ykt_xx PARTITION ( dt = '2018-01-01' ) 
SELECT
kh,
NULL,
NULL,
NULL,
NULL,
xm,
NULL,
sfrzh,
NULL,
NULL,
NULL,
zhye,
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
NULL,
sfrzh,
NULL,
xh,
NULL,
zcrq,
NULL,
NULL,
NULL,
NULL,
NULL,
kpzt 
FROM
ods.ods_usr_gxsj_t_ykt_kh;

--  DESCRIPTION: ods->fdm 一卡通商户信息表(fdm_ykt_shxx)
INSERT OVERWRITE TABLE fdm.fdm_ykt_shxx PARTITION ( dt = '2018-01-01' ) 
SELECT
shid,
shmc,
NULL,
NULL,
NULL,
NULL,
NULL,
NULL 
FROM
ods.ods_usr_gxsj_t_ykt_shxx;

--  DESCRIPTION: ods->fdm 一卡通交易信息表(fdm_ykt_jy_log)			
INSERT OVERWRITE TABLE fdm.fdm_ykt_jy_log PARTITION ( dt = '2018-01-01' ) 
SELECT
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
a.xfye 
FROM
( SELECT kh,xfje,xfrq,xfrqsj,xfsbbh,xfye,xfdwid FROM ods.ods_usr_gxsj_t_ykt_xfjl WHERE dt = '2018-01-01' ) A
LEFT JOIN ( SELECT kh,xh FROM ods.ods_usr_gxsj_t_ykt_KH  ) B ON A.KH = B.kh
LEFT JOIN ( SELECT shmc,shid,xfsbid,xfdwid FROM ods.ods_usr_gxsj_t_ykt_xfsbbh ) c ON (
CAST ( CAST ( C.xfsbid AS int ) AS string )) = a.xfsbbh 
AND (
CAST ( CAST ( c.xfdwid AS int ) AS string )) = a.xfdwid;