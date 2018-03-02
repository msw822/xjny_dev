--  DESCRIPTION: 中央专项投资补助名称代码
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
DROP TABLE IF EXISTS hb_zyzxtzbzmc
;
CREATE EXTERNAL TABLE hb_zyzxtzbzmc (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
)  COMMENT '[中央专项投资补助名称代码]规定中央专项投资补助的项目的类别名称。'
row format delimited
fields terminated by '\t'
STORED AS textfile;
