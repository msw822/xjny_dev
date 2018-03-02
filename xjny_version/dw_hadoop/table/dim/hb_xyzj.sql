--  DESCRIPTION: 宗教信仰代码
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
DROP TABLE IF EXISTS hb_xyzj;
CREATE EXTERNAL TABLE hb_xyzj (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
)  COMMENT '[宗教信仰代码]宗教枚举值，本代码引自GA 214.12-2004。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
