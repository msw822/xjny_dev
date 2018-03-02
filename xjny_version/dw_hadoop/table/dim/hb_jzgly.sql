--  DESCRIPTION: 教职工来源代码
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
DROP TABLE IF EXISTS hb_jzgly;
CREATE EXTERNAL TABLE hb_jzgly (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[教职工来源代码]教职工入校工作时来源的分类。适用于中小学校、中等职业学校和幼儿园'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
