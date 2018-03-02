--  DESCRIPTION: 奖学金类型代码
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
DROP TABLE IF EXISTS hb_jxjlx;
CREATE EXTERNAL TABLE hb_jxjlx (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[奖学金类型代码]高等学校和中等职业学校设立的奖学金分类'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
