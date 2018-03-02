--  DESCRIPTION: 教室占用情况代码
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
DROP TABLE IF EXISTS hb_jszyqk;
CREATE EXTERNAL TABLE hb_jszyqk (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[教室占用情况代码]规定高等学校教室占用情况与占用用途的分类。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
