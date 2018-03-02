--  DESCRIPTION: 体检项目类别代码
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
DROP TABLE IF EXISTS hb_tjxmlb;
CREATE EXTERNAL TABLE hb_tjxmlb (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[体检项目类别代码]适用于中小学校、中等职业学校、高等学校和幼儿园'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
