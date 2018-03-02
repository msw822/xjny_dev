--  DESCRIPTION: 幼儿班级类型代码
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
DROP TABLE IF EXISTS hb_yrbjlx;
CREATE EXTERNAL TABLE hb_yrbjlx (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[幼儿班级类型代码]规定学前教育幼儿班级分类，适用于幼儿园和教育统计。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
