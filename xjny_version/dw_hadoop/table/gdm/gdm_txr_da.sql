--  DESCRIPTION: 同行人明细表
--
--     OPTIONS: ---
-- REQUIREMENTS: ---
--        BUGS: ---
--        NOTES: ---
--       AUTHOR: lizhanlei@h3c.com
--     COMPANY: h3c.bigdata
--      VERSION: 1.0
--     CREATED: 2018/02/28
--    REVIEWER:
--    REVISION:

DROP TABLE IF EXISTS gdm.gdm_txr_da;
CREATE EXTERNAL TABLE IF NOT exists gdm.gdm_txr_da (
  XH string,
  XM string,
  XH_TX string,
  XM_TX string,
  TXCS int COMMENT '同行次数',
  TXLX string COMMENT '同行类型',
  GX string
) COMMENT '同行人明细表'
PARTITIONED BY ( 
  dt string)
row format delimited
fields terminated by '\t'
STORED AS orc 
TBLPROPERTIES('orc.compress'='SNAPPY');
