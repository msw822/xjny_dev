--  DESCRIPTION: 中小学实验室类别代码
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
DROP TABLE IF EXISTS hb_zxxsyslb;
CREATE EXTERNAL TABLE hb_zxxsyslb (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[中小学实验室类别代码]规定中小学校教学实验室的分类。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
