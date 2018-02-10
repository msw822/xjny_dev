--  DESCRIPTION: ods->fdm 图书主题
--
--     OPTIONS: ---
-- REQUIREMENTS: ---
--        BUGS: ---
--        NOTES: ---
--       AUTHOR: mashaowei@h3c.com
--     COMPANY: h3c.bigdata
--      VERSION: 1.0
--     CREATED: 2018/02/08
--    REVIEWER:
--    REVISION:

set mapred.output.compress=true; 
set hive.exec.compress.output=true; 
set mapred.output.compression.codec=org.apache.hadoop.io.compress.SnappyCodec; 
set mapred.output.compression.type=block;

--  DESCRIPTION: ods->fdm 读者信息表(fdm_ts_dz)
INSERT OVERWRITE TABLE fdm.fdm_ts_dzxx PARTITION (dt = '2999-12-31') 
SELECT
sfrzh,
dztm,
sfrzh,
zjhm,
NULL,
NULL,
NULL,
bzrq,
NULL,
NULL,
NULL,
qkje,
NULL,
NULL,
ljcc,
NULL,
NULL,
NULL,
NULL
FROM
ods.ods_usr_gxsj_t_ts_dz


--WHERE
--sfrzh LIKE '2%'


--  DESCRIPTION: ods->fdm 图书借阅记录表(fdm_ts_jyjl)
INSERT OVERWRITE TABLE fdm.fdm_ts_jyjl PARTITION (dt = '2017-02-02') 
SELECT
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
  NULL
FROM
  (
    SELECT
      sfrzh,
      tstm,
      czlx,
      rq
    FROM
      ods.ods_usr_gxsj_T_TS_JHSHU WHERE dt='2017-02-02' AND
    czlx = 'WJ'
  ) a
LEFT JOIN (SELECT tstm, tm FROM ods.ods_usr_gxsj_T_TS_TSXX) b ON a.TSTM = b.TSTM
LEFT JOIN ods.ods_usr_gxsj_t_ts_dz c ON a.sfrzh = c.sfrzh


  
  
  
  
--  DESCRIPTION: ods->fdm 图书信息表(fdm_ts_tsxx)
INSERT OVERWRITE TABLE fdm.fdm_ts_tsxx PARTITION (dt = '2999-12-31') 
SELECT
dlh,
tstm,
tm,
NULL,
NULL,
NULL,
NULL,
NULL,
NULL,
jg,
NULL,
NULL,
ztflh,
NULL,
NULL,
NULL,
NULL,
NULL,
NULL,
NULL,
NULL,
cbz,
NULL,
cbd,
NULL,
NULL,
NULL,
NULL
FROM
ods.ods_usr_gxsj_t_ts_tsxx
