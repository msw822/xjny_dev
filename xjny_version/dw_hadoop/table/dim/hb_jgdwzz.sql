--  DESCRIPTION: 监管单位资质代码
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
DROP TABLE IF EXISTS hb_jgdwzz;
CREATE EXTERNAL TABLE hb_jgdwzz (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[监管单位资质代码]规定监理单位所具有的工程监理资质等级。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
