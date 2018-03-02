--  DESCRIPTION: JB级别码表
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
DROP TABLE IF EXISTS hb_jb;
CREATE EXTERNAL TABLE hb_jb (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[JB级别码表]以行政级别为主规定了级别'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
