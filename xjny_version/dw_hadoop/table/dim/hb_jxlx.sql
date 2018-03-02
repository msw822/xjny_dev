--  DESCRIPTION: 教学类型代码
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
DROP TABLE IF EXISTS hb_jxlx;
CREATE EXTERNAL TABLE hb_jxlx (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[教学类型代码]规定教师从事教学工作的分类。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
