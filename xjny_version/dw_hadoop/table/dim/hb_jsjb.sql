--  DESCRIPTION: 竞赛级别代码
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
DROP TABLE IF EXISTS hb_jsjb;
CREATE EXTERNAL TABLE hb_jsjb (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[竞赛级别代码]高等学校学生参加课外竞赛的级别分类'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
