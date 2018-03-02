--  DESCRIPTION: 导师类别
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
DROP TABLE IF EXISTS hb_dslb;
CREATE EXTERNAL TABLE hb_dslb (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[导师类别]指导研究生的教师分类。适用于高等学校'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
