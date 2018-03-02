--  DESCRIPTION: 研究生专项计划类别代码
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
DROP TABLE IF EXISTS hb_yjszxjhlb;
CREATE EXTERNAL TABLE hb_yjszxjhlb (
  DM string COMMENT '代码',
  MC string COMMENT '名称',
  SYFW string COMMENT '适用范围'
)  COMMENT '[研究生专项计划类别代码]高等学校研究生招生专项计划的类别'
row format delimited
fields terminated by '\t'
STORED AS textfile
;