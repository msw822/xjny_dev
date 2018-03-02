--  DESCRIPTION: 血型代码
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
DROP TABLE IF EXISTS hb_xx;
CREATE EXTERNAL TABLE hb_xx (
  DM string COMMENT '代码',
  MC string COMMENT '名称',
  JC string COMMENT '简称'
) COMMENT '[血型代码]规定了人类血型的分类编码，采用顺序码，用一位数字表示。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
