--  DESCRIPTION: 来访代表团成员身份代码
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
DROP TABLE IF EXISTS hb_lfdbtcysf
;
CREATE EXTERNAL TABLE hb_lfdbtcysf (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[来访代表团成员身份代码]规定来访代表团的成员身份，适用于高等学校国际合作与交流。'
row format delimited
fields terminated by '\t'
STORED AS textfile;