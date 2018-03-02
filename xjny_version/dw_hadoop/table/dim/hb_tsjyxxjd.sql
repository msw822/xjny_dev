--  DESCRIPTION: 特殊教育学习阶段代码
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
DROP TABLE IF EXISTS hb_tsjyxxjd;
CREATE EXTERNAL TABLE hb_tsjyxxjd (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
)  COMMENT '[特殊教育学习阶段代码]规定特殊教育学校基础教育学习阶段的分类。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
