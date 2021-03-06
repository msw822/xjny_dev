--  DESCRIPTION: 师范学生类别代码
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
DROP TABLE IF EXISTS hb_sfxslb;
CREATE EXTERNAL TABLE hb_sfxslb (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[师范学生类别代码]与教师培养相关的学生类别。适用于高等师范院校和中等师范学校'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
