--  DESCRIPTION: 刊物级别代码
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
DROP TABLE IF EXISTS hb_kwjb;
CREATE EXTERNAL TABLE hb_kwjb (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[刊物级别代码]本代码代替2002年的DM-KWJB《刊物级别代码》'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
