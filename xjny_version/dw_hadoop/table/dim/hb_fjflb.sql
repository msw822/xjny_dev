--  DESCRIPTION: 附加分类别代码
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
DROP TABLE IF EXISTS hb_fjflb;
CREATE EXTERNAL TABLE hb_fjflb (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[附加分类别代码]高等学校招生考试附加分类别'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
