--  DESCRIPTION: 奖励级别码
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
DROP TABLE IF EXISTS hb_jljb;
CREATE EXTERNAL TABLE hb_jljb (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[奖励级别码]/JB 级别代码'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
