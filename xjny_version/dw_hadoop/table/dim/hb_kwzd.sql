--  DESCRIPTION: 刊物装订代码
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
DROP TABLE IF EXISTS hb_kwzd;
CREATE EXTERNAL TABLE hb_kwzd (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
)  COMMENT '[刊物装订代码]规定土地的取得方式，适用于各级各类学校（机构）。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
