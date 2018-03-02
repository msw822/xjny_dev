--  DESCRIPTION: 培训进修时限代码
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
DROP TABLE IF EXISTS hb_pxjxsx;
CREATE EXTERNAL TABLE hb_pxjxsx (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[培训进修时限代码]规定教育统计所要求的高等教育、中等职业教育学校培训时限的分类。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
