--  DESCRIPTION: 学科门类（科技）代码
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
DROP TABLE IF EXISTS hb_xkmlkj;
CREATE EXTERNAL TABLE hb_xkmlkj (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[学科门类（科技）代码]适用于中小学校、中等职业学校和高等学校科研管理的学科门类划分'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
