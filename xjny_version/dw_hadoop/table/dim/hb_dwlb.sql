--  DESCRIPTION: 单位类别代码
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
DROP TABLE IF EXISTS hb_dwlb;
CREATE EXTERNAL TABLE hb_dwlb (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[单位类别代码]规定高等学校校内单位的职能、性质类别。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
