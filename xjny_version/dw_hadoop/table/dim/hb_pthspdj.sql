--  DESCRIPTION: 普通话水平等级代码
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
DROP TABLE IF EXISTS hb_pthspdj;
CREATE EXTERNAL TABLE hb_pthspdj (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[普通话水平等级代码]规定国家普通话水平考试认定的水平等级,适用于高等学校。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
