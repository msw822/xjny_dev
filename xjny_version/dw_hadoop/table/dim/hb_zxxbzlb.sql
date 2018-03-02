--  DESCRIPTION: 中小学编制类别代码
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
DROP TABLE IF EXISTS hb_zxxbzlb;
CREATE EXTERNAL TABLE hb_zxxbzlb (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[中小学编制类别代码]规定中小学校在职教职工编制的类别。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
