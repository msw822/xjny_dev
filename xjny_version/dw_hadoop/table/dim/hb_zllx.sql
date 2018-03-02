--  DESCRIPTION: ZLLX专利类型码表
--
--     OPTIONS: ---
-- REQUIREMENTS: ---
--        BUGS: ---
--        NOTES: ---
--       AUTHOR: song.shengjie@h3c.com
--     COMPANY: h3c.bigdata
--      VERSION: 1.0
--     CREATED: 2017/08/18
--    REVIEWER:
--    REVISION: ---
--
use dim;
DROP TABLE IF EXISTS hb_zllx;
CREATE EXTERNAL TABLE hb_zllx (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[ZLLX专利类型码表]规定了专利成果类型的划分，采用顺序码，用一位数字表示。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
