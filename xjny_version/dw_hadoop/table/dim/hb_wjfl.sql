--  DESCRIPTION: 文件分类代码
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
DROP TABLE IF EXISTS hb_wjfl;
CREATE EXTERNAL TABLE hb_wjfl (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[文件分类代码]规定公文种类的划分。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
