--  DESCRIPTION: 学校办别代码
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
DROP TABLE IF EXISTS hb_xxbb;
CREATE EXTERNAL TABLE hb_xxbb (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[学校办别代码]规定中小学校和中等职业学校举办者的分类。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
