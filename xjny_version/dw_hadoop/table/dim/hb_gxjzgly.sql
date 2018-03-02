--  DESCRIPTION: 高校教职工来源代码
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
DROP TABLE IF EXISTS hb_gxjzgly;
CREATE EXTERNAL TABLE hb_gxjzgly (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[高校教职工来源代码]高等学校教职工入校工作时的来源分类'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
