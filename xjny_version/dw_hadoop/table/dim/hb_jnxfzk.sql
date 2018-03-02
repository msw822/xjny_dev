--  DESCRIPTION: 缴纳学费状况代码
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
DROP TABLE IF EXISTS hb_jnxfzk;
CREATE EXTERNAL TABLE hb_jnxfzk (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[缴纳学费状况代码]高等学校学生缴纳学费状况的分类'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
