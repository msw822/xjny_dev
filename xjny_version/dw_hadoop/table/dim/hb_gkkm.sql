--  DESCRIPTION: 高考科目代码
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
DROP TABLE IF EXISTS hb_gkkm;
CREATE EXTERNAL TABLE hb_gkkm (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[高考科目代码]高等学校统一招生考试的科目分类'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
