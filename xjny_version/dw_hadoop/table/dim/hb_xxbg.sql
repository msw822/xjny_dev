--  DESCRIPTION: 学校变更代码
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
DROP TABLE IF EXISTS hb_xxbg;
CREATE EXTERNAL TABLE hb_xxbg (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[学校变更代码]规定各级各类学校（机构）变更的分类。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
