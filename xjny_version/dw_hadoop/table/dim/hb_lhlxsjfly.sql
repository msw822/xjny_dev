--  DESCRIPTION: 来华留学生经费来源代码
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
DROP TABLE IF EXISTS hb_lhlxsjfly;
CREATE EXTERNAL TABLE hb_lhlxsjfly (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[来华留学生经费来源代码]适用于高等学校和教育行政部门'

row format delimited
fields terminated by '\t'
STORED AS textfile
;
