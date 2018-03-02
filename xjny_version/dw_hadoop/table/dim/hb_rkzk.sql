--  DESCRIPTION: 任课状况码
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
DROP TABLE IF EXISTS hb_rkzk;
CREATE EXTERNAL TABLE hb_rkzk (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[任课状况码]规定了学校专任教师任课状况的分类,采用二层二位数字码，第一位表示大类，第二位表示小类'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
