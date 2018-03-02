--  DESCRIPTION: 学生收费调整方式代码
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
DROP TABLE IF EXISTS hb_xssftzfs;
CREATE EXTERNAL TABLE hb_xssftzfs (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
)  COMMENT '[学生收费调整方式代码]学校根据具体情况对学生个体进行收费调整'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
