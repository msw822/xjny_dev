--  DESCRIPTION: 来华留学生重点关注类别代码
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
DROP TABLE IF EXISTS hb_lhlxszdglb;
CREATE EXTERNAL TABLE hb_lhlxszdglb (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[来华留学生重点关注类别代码]需重点关注的来华留学生类别，适用于高等学校和教育行政部门'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
