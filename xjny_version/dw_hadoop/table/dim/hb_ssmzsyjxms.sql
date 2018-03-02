--  DESCRIPTION: 少数民族双语教学模式代码
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
DROP TABLE IF EXISTS hb_ssmzsyjxms
;
CREATE EXTERNAL TABLE hb_ssmzsyjxms (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[少数民族双语教学模式代码]。'
row format delimited
fields terminated by '\t'
STORED AS textfile;
