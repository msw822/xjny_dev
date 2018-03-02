--  DESCRIPTION: 课程类型代码
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
DROP TABLE IF EXISTS hb_kclx;
CREATE EXTERNAL TABLE hb_kclx (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[课程类型代码]规定高等学校按培养层次分类的课程类型。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
