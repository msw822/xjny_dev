--  DESCRIPTION: 招聘会类别代码
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
DROP TABLE IF EXISTS hb_zphlb;
CREATE EXTERNAL TABLE hb_zphlb (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[招聘会类别代码]适用于高等学校学生就业管理中社会单位对即将毕业的学生举办招聘会的类型划分'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
