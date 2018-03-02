--  DESCRIPTION: 所在地区经济属性代码
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
DROP TABLE IF EXISTS hb_szdqjjsx;
CREATE EXTERNAL TABLE hb_szdqjjsx (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[所在地区经济属性代码]规定中小学校和幼儿园所在地区是否贫困县的分类。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
