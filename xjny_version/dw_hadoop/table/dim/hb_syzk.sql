--  DESCRIPTION: 使用状况代码
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
DROP TABLE IF EXISTS hb_syzk;
CREATE EXTERNAL TABLE hb_syzk (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[使用状况代码]规定中小学校、中等职业学校、高等学校和幼儿园资产使用状况的分类。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
