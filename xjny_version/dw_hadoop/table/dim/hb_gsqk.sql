--  DESCRIPTION: 供水情况代码
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
DROP TABLE IF EXISTS hb_gsqk;
CREATE EXTERNAL TABLE hb_gsqk (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[供水情况代码]规定基础教育学校（机构）供水情况的分类。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
