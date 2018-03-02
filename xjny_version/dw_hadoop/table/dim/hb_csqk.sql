--  DESCRIPTION: 厕所情况代码
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
DROP TABLE IF EXISTS hb_csqk;
CREATE EXTERNAL TABLE hb_csqk (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[厕所情况代码]规定基础教育各类学校厕所现况的分类。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
