--  DESCRIPTION: 供暖方式代码
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
DROP TABLE IF EXISTS hb_gnfs;
CREATE EXTERNAL TABLE hb_gnfs (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
)  COMMENT '[供暖方式代码]规定建筑物供暖采用的形式。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
