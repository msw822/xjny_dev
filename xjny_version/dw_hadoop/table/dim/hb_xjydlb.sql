--  DESCRIPTION: 学籍异动类别码表
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
DROP TABLE IF EXISTS hb_xjydlb;
CREATE EXTERNAL TABLE hb_xjydlb (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
)  COMMENT '[学籍异动类别码表]本代码规定了学生学籍异动的类别。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
