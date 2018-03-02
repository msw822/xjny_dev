--  DESCRIPTION: 中小学课程代码
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
DROP TABLE IF EXISTS hb_zxxkc;
CREATE EXTERNAL TABLE hb_zxxkc (
  DM string COMMENT '代码',
  MC string COMMENT '名称',
  SYXX string COMMENT '适用学校'
) COMMENT '[中小学课程代码]规定中小学校开设的课程。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
