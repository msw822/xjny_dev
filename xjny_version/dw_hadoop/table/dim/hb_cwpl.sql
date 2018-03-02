--  DESCRIPTION: 财务票类代码
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
DROP TABLE IF EXISTS hb_cwpl;
CREATE EXTERNAL TABLE hb_cwpl (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[财务票类代码]高等学校财务票据的种类'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
