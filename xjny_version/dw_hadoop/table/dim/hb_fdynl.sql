--  DESCRIPTION: 辅导员年龄代码
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
DROP TABLE IF EXISTS hb_fdynl;
CREATE EXTERNAL TABLE hb_fdynl (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[辅导员年龄代码]教育统计所要求的高等学校专职辅导员年龄情况的分类'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
