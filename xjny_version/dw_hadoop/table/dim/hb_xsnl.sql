--  DESCRIPTION: 学生年龄代码
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
DROP TABLE IF EXISTS hb_xsnl;
CREATE EXTERNAL TABLE hb_xsnl (
  DM string COMMENT '代码',
  MC string COMMENT '名称',
  JYTJSYXX string COMMENT '教育统计适用学校'
) COMMENT '[学生年龄代码]适用于各级各类学校（包括幼儿园和其他教育机构）'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
