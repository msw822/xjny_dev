--  DESCRIPTION: 办学类型代码
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
DROP TABLE IF EXISTS hb_bxlx;
CREATE EXTERNAL TABLE hb_bxlx (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[办学类型代码]采用三层三位数字码，第一位表示教育层次行业分类，第二层用前二位数字表示学校类别，第三位表示办学类型。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
