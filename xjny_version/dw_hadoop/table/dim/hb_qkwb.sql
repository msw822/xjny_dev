--  DESCRIPTION: 缺考舞弊代码
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
DROP TABLE IF EXISTS hb_qkwb;
CREATE EXTERNAL TABLE hb_qkwb (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[缺考舞弊代码]规定高等学校学生在考试中的缺考或舞弊的分类。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
