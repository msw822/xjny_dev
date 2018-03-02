--  DESCRIPTION: 课程属性代码
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
DROP TABLE IF EXISTS hb_kcsx;
CREATE EXTERNAL TABLE hb_kcsx (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[课程属性代码]规定高等学校和中等职业学校教学计划课程对学生学业要求的属性分类。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
