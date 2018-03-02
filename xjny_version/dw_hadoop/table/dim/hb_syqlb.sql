--  DESCRIPTION: 授予权类别代码
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
DROP TABLE IF EXISTS hb_syqlb;
CREATE EXTERNAL TABLE hb_syqlb (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[授予权类别代码]规定高等学校学科点（学位）授予权的分类。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
