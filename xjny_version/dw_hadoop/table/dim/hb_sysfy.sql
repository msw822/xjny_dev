--  DESCRIPTION: 实验室费用代码
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
DROP TABLE IF EXISTS hb_sysfy;
CREATE EXTERNAL TABLE hb_sysfy (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[实验室费用代码]规定高等学校和中等职业学校实验室费用的分类。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
