--  DESCRIPTION: 消防耐火等级代码
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
DROP TABLE IF EXISTS hb_xfnhdj;
CREATE EXTERNAL TABLE hb_xfnhdj (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[消防耐火等级代码]规定单体建筑物的耐火等级的分类。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
