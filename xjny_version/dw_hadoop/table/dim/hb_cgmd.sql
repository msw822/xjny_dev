--  DESCRIPTION: 出国目的代码
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
DROP TABLE IF EXISTS hb_cgmd;
CREATE EXTERNAL TABLE hb_cgmd (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
)  COMMENT '[出国目的代码]规定出国目的分类，适用于高等学校师生员工。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
