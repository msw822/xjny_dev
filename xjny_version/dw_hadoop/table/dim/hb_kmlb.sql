--  DESCRIPTION: 科目类别代码
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
DROP TABLE IF EXISTS hb_kmlb;
CREATE EXTERNAL TABLE hb_kmlb (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[科目类别代码]高等学校财务资金科目类别的划分'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
