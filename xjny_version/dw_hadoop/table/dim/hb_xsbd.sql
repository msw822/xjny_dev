--  DESCRIPTION: 学生变动代码
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
DROP TABLE IF EXISTS hb_xsbd;
CREATE EXTERNAL TABLE hb_xsbd (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[学生变动代码]适用于各级各类学校（机构'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
