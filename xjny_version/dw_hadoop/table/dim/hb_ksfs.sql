--  DESCRIPTION: 考试方式码
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
DROP TABLE IF EXISTS hb_ksfs;
CREATE EXTERNAL TABLE hb_ksfs (
  DM string COMMENT '代码',
  MC string COMMENT '名称',
  SM string COMMENT '说明'
) COMMENT '[考试方式码]规定了中小学校、中等职业学校和高等学校的考试方式分类'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
