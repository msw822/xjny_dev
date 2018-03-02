--  DESCRIPTION: 分录标记代码
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
DROP TABLE IF EXISTS hb_flbj;
CREATE EXTERNAL TABLE hb_flbj (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[分录标记代码]高等学校财务管理的借贷分类'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
