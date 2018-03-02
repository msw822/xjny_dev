--  DESCRIPTION: 残疾人类型代码
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
DROP TABLE IF EXISTS hb_cjrlx;
CREATE EXTERNAL TABLE hb_cjrlx (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[残疾人类型代码]教育统计所要求的残疾学生类型，适用于初中、小学、特殊教育对残疾学生的统计'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
