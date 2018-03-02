--  DESCRIPTION: 入学方式代码表
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
DROP TABLE IF EXISTS hb_rxfs;
CREATE EXTERNAL TABLE hb_rxfs (
  DM string COMMENT '代码',
  MC string COMMENT '名称',
  syxx string COMMENT '适用学校'
) COMMENT '[入学方式代码表]规定了高等学校本科学生,入学方式的分类,用二位数字表示'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
