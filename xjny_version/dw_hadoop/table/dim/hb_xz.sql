--  DESCRIPTION: 学制代码
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
DROP TABLE IF EXISTS hb_xz;
CREATE EXTERNAL TABLE hb_xz (
  DM string COMMENT '代码',
  MC string COMMENT '名称',
  SYXX string
) COMMENT '[学制代码]规定教育统计所要求的小学、初中规定学制的分类。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
