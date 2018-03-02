--  DESCRIPTION: 档案业务行为代码
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
DROP TABLE IF EXISTS hb_daywxw;
CREATE EXTERNAL TABLE hb_daywxw (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[档案业务行为代码]规定档案业务行为的分类。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
