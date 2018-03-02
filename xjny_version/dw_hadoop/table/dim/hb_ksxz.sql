--  DESCRIPTION: 考试性质码
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
DROP TABLE IF EXISTS hb_ksxz;
CREATE EXTERNAL TABLE hb_ksxz (
  DM string COMMENT '代码',
  MC string COMMENT '名称',
  SM string COMMENT '说明'
) COMMENT '[考试性质码]规定了学生参加某门课程考试的性质分类.第一位表示大类，第二位表示小类.'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
