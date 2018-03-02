--  DESCRIPTION: 地勘单位资质代码
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
DROP TABLE IF EXISTS hb_dkdwzz;
CREATE EXTERNAL TABLE hb_dkdwzz (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[地勘单位资质代码]规定勘察单位所具有的勘察资质等级。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
