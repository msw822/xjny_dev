--  DESCRIPTION: 困难原因代码
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
DROP TABLE IF EXISTS hb_knyy;
CREATE EXTERNAL TABLE hb_knyy (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[困难原因代码]本代码规定了学生家庭困难原因的分类'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
