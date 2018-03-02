--  DESCRIPTION: 班额代码
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
DROP TABLE IF EXISTS hb_be;
CREATE EXTERNAL TABLE hb_be (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[班额代码]规定教育统计所要求的基础教育学校（机构）的班级学生人数的分类。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
