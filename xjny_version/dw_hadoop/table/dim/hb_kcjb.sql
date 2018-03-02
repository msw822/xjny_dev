--  DESCRIPTION: 班级信息表
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
DROP TABLE IF EXISTS hb_kcjb;
CREATE EXTERNAL TABLE hb_kcjb (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[课程级别代码]规定高等学校教学计划中精品/重点课程级别的分类。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
