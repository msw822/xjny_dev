--  DESCRIPTION: 入学年龄代码
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
DROP TABLE IF EXISTS hb_rxnl;
CREATE EXTERNAL TABLE hb_rxnl (
  DM string COMMENT '代码',
  MC string COMMENT '名称',
  SYXX string COMMENT '适用学校'
) COMMENT '[入学年龄代码]规定教育统计所要求的小学、初中规定入学年龄的分类。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
