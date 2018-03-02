--  DESCRIPTION: 奖励资助资金来源代码
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
DROP TABLE IF EXISTS hb_jlzzzjly;
CREATE EXTERNAL TABLE hb_jlzzzjly (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
)  COMMENT '[奖励资助资金来源代码]高等学校、中小学校和中等职业学校奖励资助资金来源'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
