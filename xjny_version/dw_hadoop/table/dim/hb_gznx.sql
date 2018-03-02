--  DESCRIPTION: 工作年限代码
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
DROP TABLE IF EXISTS hb_gznx;
CREATE EXTERNAL TABLE hb_gznx (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[工作年限代码]教育统计所要求的高等学校教职工从事心理健康教育工作年限'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
