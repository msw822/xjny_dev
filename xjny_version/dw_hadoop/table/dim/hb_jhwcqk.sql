--  DESCRIPTION: 计划完成情况代码
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
DROP TABLE IF EXISTS hb_jhwcqk;
CREATE EXTERNAL TABLE hb_jhwcqk (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[计划完成情况代码]本代码采用顺序码，用一位数字表示'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
