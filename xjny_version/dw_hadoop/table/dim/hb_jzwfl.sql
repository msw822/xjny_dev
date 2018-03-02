--  DESCRIPTION: 建筑物分类代码
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
DROP TABLE IF EXISTS hb_jzwfl;
CREATE EXTERNAL TABLE hb_jzwfl (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
  ) COMMENT '[建筑物分类代码]规定校园建筑物的分类。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
