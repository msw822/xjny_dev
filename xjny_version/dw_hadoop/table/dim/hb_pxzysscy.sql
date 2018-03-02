--  DESCRIPTION: 培训专业所属产业代码
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
DROP TABLE IF EXISTS hb_pxzysscy;
CREATE EXTERNAL TABLE hb_pxzysscy (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[培训专业所属产业代码]规定教育统计所要求的培训专业所属产业的分类。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
