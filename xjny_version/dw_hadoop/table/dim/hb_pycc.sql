--  DESCRIPTION: 培养层次代码
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
DROP TABLE IF EXISTS hb_pycc;
CREATE EXTERNAL TABLE hb_pycc (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[培养层次代码]规定了高等学校学生培养层次的分类'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
