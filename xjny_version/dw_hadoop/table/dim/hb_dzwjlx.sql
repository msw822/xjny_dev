--  DESCRIPTION: 电子文件类型代码
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
DROP TABLE IF EXISTS hb_dzwjlx;
CREATE EXTERNAL TABLE hb_dzwjlx (
  DM string,
  MC string
) COMMENT '[电子文件类型代码]'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
