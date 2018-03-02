--  DESCRIPTION: 违纪类别代码
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
DROP TABLE IF EXISTS hb_wjlb;
CREATE EXTERNAL TABLE hb_wjlb (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
)  COMMENT '[违纪类别代码]高等学校学生违纪违法类别的划分'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
