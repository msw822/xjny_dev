--  DESCRIPTION: 预算类总分类科目代码
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
DROP TABLE IF EXISTS hb_yslzflkm;
CREATE EXTERNAL TABLE hb_yslzflkm (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[预算类总分类科目代码]高等学校财务管理中的预算类总分科目'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
