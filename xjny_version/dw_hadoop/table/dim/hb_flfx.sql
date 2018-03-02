--  DESCRIPTION: 分流方向代码
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
DROP TABLE IF EXISTS hb_flfx;
CREATE EXTERNAL TABLE hb_flfx (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[分流方向代码]高等学校学生学业结束时的分流方向类别'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
