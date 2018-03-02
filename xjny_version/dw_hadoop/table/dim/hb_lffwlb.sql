--  DESCRIPTION: 来访访问类别代码
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
DROP TABLE IF EXISTS hb_lffwlb;
CREATE EXTERNAL TABLE hb_lffwlb (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[来访访问类别代码]规定来访的访问类别。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
