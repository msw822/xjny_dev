--  DESCRIPTION: 紧急程度代码
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
DROP TABLE IF EXISTS hb_jjcd;
CREATE EXTERNAL TABLE hb_jjcd (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[紧急程度代码]规定公文处理紧急程度的分类。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
