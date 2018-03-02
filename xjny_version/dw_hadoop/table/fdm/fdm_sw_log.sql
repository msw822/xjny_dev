--  DESCRIPTION: 上网信息表
--
--     OPTIONS: ---
-- REQUIREMENTS: ---
--        BUGS: ---
--        NOTES: ---
--       AUTHOR: song.shengjie@h3c.com
--     COMPANY: h3c.bigdata
--      VERSION: 1.0
--     CREATED: 2018/02/11
--    REVIEWER:
--    REVISION:
DROP TABLE IF EXISTS fdm.fdm_sw_log;
CREATE EXTERNAL TABLE
IF NOT EXISTS fdm.fdm_sw_log (
  XH string COMMENT '学号',
  LOGIN_TIME string COMMENT '上网开始时间',
  LOGOUT_TIME string COMMENT '上网结束时间',
  TIME_LONG smallint COMMENT '上网总时长',
  BYTES_IN string COMMENT 'ipv4入流量(bytes)',
  BYTES_OUT string COMMENT 'ipv4出流量(bytes)',
  BYTES_IN6 string COMMENT 'ipv6入流量(bytes)',
  BYTES_OUT6 string COMMENT 'ipv6出流量(bytes)',
  TOTAL_BYTES string COMMENT '总流量(bytes)'
) COMMENT  '[上网信息表]fdm' 
PARTITIONED BY (dt string)
row format delimited
fields terminated by '\t'
stored as orc
TBLPROPERTIES('orc.compres'='SNAPPY');

