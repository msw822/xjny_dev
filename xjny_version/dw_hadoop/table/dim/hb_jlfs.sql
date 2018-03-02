--  DESCRIPTION: 奖励方式码
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
DROP TABLE IF EXISTS hb_jlfs;
CREATE EXTERNAL TABLE hb_jlfs (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
)  COMMENT '[奖励方式码]规定了高等学校学生获得奖励的方式分类。采用顺序码，用一位数字表示。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
