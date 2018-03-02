--  DESCRIPTION: 学位类别代码
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
DROP TABLE IF EXISTS hb_xwlb;
CREATE EXTERNAL TABLE hb_xwlb (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[学位类别代码]规定高等教育各阶段授予学位的类别。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
