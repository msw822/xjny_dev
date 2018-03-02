--  DESCRIPTION: 社会实践等级代码
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
DROP TABLE IF EXISTS hb_shsjdj;
CREATE EXTERNAL TABLE hb_shsjdj (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[社会实践等级代码]高等学校学生参加社会实践等级的分类'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
