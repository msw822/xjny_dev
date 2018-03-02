--  DESCRIPTION: 本专科专业目录
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
DROP TABLE IF EXISTS hb_bzkzy;
CREATE EXTERNAL TABLE hb_bzkzy (
  DM string COMMENT '单位码',
  MC string COMMENT '单位名称',
  LS string COMMENT '上级类别',
  CC string COMMENT '层次'
) COMMENT '[本专科专业目录]'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
