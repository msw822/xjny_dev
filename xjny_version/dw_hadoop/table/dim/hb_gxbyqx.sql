--  DESCRIPTION: 高校毕业去向
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
DROP TABLE IF EXISTS hb_gxbyqx;
CREATE EXTERNAL TABLE hb_gxbyqx (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
)COMMENT '[高校毕业去向]高等学校毕业生（包括专科生、本科生、硕士生、博士生）毕业去向的分类'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
