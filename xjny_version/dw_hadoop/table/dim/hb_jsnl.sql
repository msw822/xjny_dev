--  DESCRIPTION: 教师年龄代码
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
DROP TABLE IF EXISTS hb_jsnl;
CREATE EXTERNAL TABLE hb_jsnl (
  DM string COMMENT '代码',
  MC string COMMENT '名称',
  JYTJSYXX string COMMENT '教育统计适用学校'
) COMMENT '[教师年龄代码]各级各类学校（包括幼儿园和其他教育机构）的专任教师及研究生导师等人员年龄段'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
