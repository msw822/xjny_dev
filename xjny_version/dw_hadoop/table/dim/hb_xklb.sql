--  DESCRIPTION: 学科列表	
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
DROP TABLE IF EXISTS hb_xklb;
CREATE EXTERNAL TABLE hb_xklb (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[学科列表]一级学科代码'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
