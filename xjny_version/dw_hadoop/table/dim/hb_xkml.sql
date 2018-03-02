--  DESCRIPTION: 学科门类（科技）代码表
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
DROP TABLE IF EXISTS hb_xkml;
CREATE EXTERNAL TABLE hb_xkml (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[学科门类（科技）代码表]本代码采用顺序码，用一位数字表'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
