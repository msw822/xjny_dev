--  DESCRIPTION: 处分名称代码
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
DROP TABLE IF EXISTS hb_cfmc;
CREATE EXTERNAL TABLE hb_cfmc (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[处分名称代码]对学生处分的分类，适用于高等学校'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
