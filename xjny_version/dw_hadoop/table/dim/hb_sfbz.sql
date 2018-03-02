--  DESCRIPTION: 是否标志代码
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
DROP TABLE IF EXISTS hb_sfbz;
CREATE EXTERNAL TABLE hb_sfbz (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[是否标志代码]用于描述“是”与“否” 的2种标志状态。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
