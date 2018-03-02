--  DESCRIPTION: 岗位类别代码
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
DROP TABLE IF EXISTS hb_gwlb;
CREATE EXTERNAL TABLE hb_gwlb (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[岗位类别代码]中等职业学校教师岗位的分类'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
