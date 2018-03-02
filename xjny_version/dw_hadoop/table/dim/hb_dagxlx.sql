--  DESCRIPTION: 档案关系类型代码
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
DROP TABLE IF EXISTS hb_dagxlx;
CREATE EXTERNAL TABLE hb_dagxlx (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[档案关系类型代码]规定档案文件管理的关系类型。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
