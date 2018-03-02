--  DESCRIPTION: 就读方式代码
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
DROP TABLE IF EXISTS hb_jdfs;
CREATE EXTERNAL TABLE hb_jdfs (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[就读方式代码]见JYT1001'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
