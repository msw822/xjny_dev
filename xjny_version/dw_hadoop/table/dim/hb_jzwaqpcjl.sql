--  DESCRIPTION: 建筑物安全排查结论代码
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
DROP TABLE IF EXISTS hb_jzwaqpcjl;
CREATE EXTERNAL TABLE hb_jzwaqpcjl (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[建筑物安全排查结论代码]规定建筑物安全排查的结论分类。'
row format delimited
fields terminated by '\t'
lines terminated by '\n'
stored as textfile;
