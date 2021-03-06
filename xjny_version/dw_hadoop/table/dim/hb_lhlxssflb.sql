--  DESCRIPTION: 来华留学生收费类别代码
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
DROP TABLE IF EXISTS hb_lhlxssflb
;
CREATE EXTERNAL TABLE hb_lhlxssflb (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[来华留学生收费类别代码]适用于高等学校'
row format delimited
fields terminated by '\t'
STORED AS textfile;
