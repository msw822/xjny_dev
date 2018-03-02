--  DESCRIPTION: 勤工类别代码
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
DROP TABLE IF EXISTS hb_qglb;
CREATE EXTERNAL TABLE hb_qglb (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[勤工类别代码]高等学校学生勤工助学工作的类别'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
