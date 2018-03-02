--  DESCRIPTION: 就业落实方式代码
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
DROP TABLE IF EXISTS hb_jylsfs;
CREATE EXTERNAL TABLE hb_jylsfs (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[就业落实方式代码]高等学校毕业生的就业落实方式'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
