--  DESCRIPTION: 社会实践类型代码
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
DROP TABLE IF EXISTS hb_shsjlx;
CREATE EXTERNAL TABLE hb_shsjlx (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[社会实践类型代码]高等学校学生参加社会实践的类型。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
