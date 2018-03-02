--  DESCRIPTION: 抗震设防烈度代码
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
DROP TABLE IF EXISTS hb_kzsfld;
CREATE EXTERNAL TABLE hb_kzsfld (
  DM string COMMENT '代码',
  MC string COMMENT '名称',
  JC string COMMENT '简称'
) COMMENT '[抗震设防烈度代码]规定建筑物抗震设防烈度的分类。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
