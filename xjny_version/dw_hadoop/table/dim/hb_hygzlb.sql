--  DESCRIPTION: 行业工种类别
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
DROP TABLE IF EXISTS hb_hygzlb;
CREATE EXTERNAL TABLE hb_hygzlb (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[行业工种类别]教职工中工人编制人员的行业工种类别'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
