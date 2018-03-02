--  DESCRIPTION: 监考人类别代码
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
DROP TABLE IF EXISTS hb_jkrlb;
CREATE EXTERNAL TABLE hb_jkrlb (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[监考人类别代码]规定高等学校和科研机构研究生招生考试时考场监督人员的职责分类。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
