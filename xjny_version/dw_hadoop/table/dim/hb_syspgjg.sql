--  DESCRIPTION: 实验室评估结果代码
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
DROP TABLE IF EXISTS hb_syspgjg;
CREATE EXTERNAL TABLE hb_syspgjg (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[实验室评估结果代码]规定高等学校实验室综合评估的结果分类。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
