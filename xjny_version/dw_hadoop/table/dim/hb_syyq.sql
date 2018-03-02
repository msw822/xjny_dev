--  DESCRIPTION: 实验要求代码
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
DROP TABLE IF EXISTS hb_syyq;
CREATE EXTERNAL TABLE hb_syyq (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[实验要求代码]规定实验课程的分类，适用于高等学校和中等职业学校。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
