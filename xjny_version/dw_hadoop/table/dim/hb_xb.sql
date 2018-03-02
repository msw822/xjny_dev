--  DESCRIPTION: 人的性别代码
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
DROP TABLE IF EXISTS hb_xb;
CREATE EXTERNAL TABLE hb_xb (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
)  COMMENT '[人的性别代码]本代码引自GB/T 2261.1-2003。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
