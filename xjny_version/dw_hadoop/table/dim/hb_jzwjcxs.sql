--  DESCRIPTION: 建筑物基础形式代码
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
DROP TABLE IF EXISTS hb_jzwjcxs;
CREATE EXTERNAL TABLE hb_jzwjcxs (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
  ) COMMENT '[建筑物基础形式代码]规定建筑物基础采用的形式分类。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
