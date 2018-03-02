--  DESCRIPTION: 获奖类型代码
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
DROP TABLE IF EXISTS hb_hjlx;
CREATE EXTERNAL TABLE hb_hjlx (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[获奖类型代码]本代码引自GA 324.1-2001'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
