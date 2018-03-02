--  DESCRIPTION: 一卡通交易表
--
--     OPTIONS: ---
-- REQUIREMENTS: ---
--        BUGS: ---
--        NOTES: ---
--       AUTHOR: song.shengjie@h3c.com
--     COMPANY: h3c.bigdata
--      VERSION: 1.0
--     CREATED: 2017/08/11
--    REVIEWER:
--    REVISION:
DROP TABLE IF EXISTS fdm.fdm_ykt_jy_log;
CREATE EXTERNAL TABLE IF NOT EXISTS fdm.fdm_ykt_jy_log (
  KH string COMMENT '卡号',
  KXL string COMMENT '卡ID(序列号)',
  ZJH string COMMENT '证件号、身份认证号',
  JYLX string COMMENT '交易类型',
  JYJE double COMMENT '交易金额',
  JYLSH string COMMENT '交易流水号',
  JYRQ string COMMENT '交易日期',
  JYSJ string COMMENT '交易时间戳',
  JYDD string COMMENT '交易地点',
  SHDM string COMMENT '商户编号',
  SHMC string COMMENT '商户名称',
  ZDJH string COMMENT 'POS编号',
  LJYKCS smallint COMMENT '累计刷卡次数',
  JYYE double COMMENT '交易余额'
) COMMENT '[一卡通交易表]fdm_ykt_jy_log'
PARTITIONED BY (dt string)
row format delimited
fields terminated by '\t'
stored as orc
TBLPROPERTIES('orc.compres'='SNAPPY');

