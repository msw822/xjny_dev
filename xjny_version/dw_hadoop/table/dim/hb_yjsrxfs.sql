--  DESCRIPTION: 研究生入学方式代码
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
DROP TABLE IF EXISTS hb_yjsrxfs;
CREATE EXTERNAL TABLE hb_yjsrxfs (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[研究生入学方式代码]高等学校攻读研究生学位的学生入学方式的分类'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
