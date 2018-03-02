--  DESCRIPTION: 反映问题类别代码
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
DROP TABLE IF EXISTS hb_fywtlb;
CREATE EXTERNAL TABLE hb_fywtlb (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[反映问题类别代码]规定高等学校信访工作反映问题的分类。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
