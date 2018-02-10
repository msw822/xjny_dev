--  DESCRIPTION: ods->fdm 门禁表---- 
--     OPTIONS: ---
-- REQUIREMENTS: ---
--        BUGS: ---
--        NOTES: ---
--       AUTHOR: mashaowei@h3c.com
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

INSERT OVERWRITE TABLE fdm.fdm_bks_mj PARTITION (dt)
SELECT
   a.num,
   b.xm,
   NULL,
   b.bh,
   a.inoutdate,
   NULL,
   (case when a.direction=='入' or a.direction=='无入'  or a.direction=='反入' then '1' else '2' end),
   NULL,
   NULL,a.dt FROM (
      SELECT
        num,
        inoutdate,
        direction,
        dt
      FROM ods.ods_usr_gxsj_t_xscrxx
   ) a
LEFT JOIN (SELECT xh, xm,bh FROM ods.ods_usr_gxsj_t_bzks) b ON a.num = b.xh



