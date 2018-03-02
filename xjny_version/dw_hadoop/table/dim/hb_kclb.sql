--  DESCRIPTION: 课程类别代码
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
DROP TABLE IF EXISTS hb_kclb;
CREATE EXTERNAL TABLE hb_kclb (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[课程类别代码]规定高等学校的课程类别。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
