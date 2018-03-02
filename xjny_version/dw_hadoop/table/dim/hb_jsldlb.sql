--  DESCRIPTION: 教师流动类别代码
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
DROP TABLE IF EXISTS hb_jsldlb;
CREATE EXTERNAL TABLE hb_jsldlb (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[教师流动类别代码]适用于幼儿园、中小学校和中等职业学校的教师'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
