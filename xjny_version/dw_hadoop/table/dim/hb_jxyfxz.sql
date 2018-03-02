--  DESCRIPTION: 教学用房性质代码
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
DROP TABLE IF EXISTS hb_jxyfxz;
CREATE EXTERNAL TABLE hb_jxyfxz (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
)  COMMENT '[教学用房性质代码]规定中小学校教学用房性质的分类。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
