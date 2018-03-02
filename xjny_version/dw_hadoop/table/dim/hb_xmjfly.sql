--  DESCRIPTION: 项目经费来源代码
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
DROP TABLE IF EXISTS hb_xmjfly;
CREATE EXTERNAL TABLE hb_xmjfly (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[项目经费来源代码]，采用顺序码，用二位数字表示。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
