--  DESCRIPTION: 来华留学生类别代码
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
DROP TABLE IF EXISTS hb_lhlxslb;
CREATE EXTERNAL TABLE hb_lhlxslb (
  DM string COMMENT '代码',
  ZWMC string COMMENT '中文名称',
  YWMC string COMMENT '英文名称'
) COMMENT '[来华留学生类别代码]适用于高等学校和教育行政部门'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
