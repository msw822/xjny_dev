--  DESCRIPTION: 委员会任职代码
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
DROP TABLE IF EXISTS hb_wyhrz;
CREATE EXTERNAL TABLE hb_wyhrz (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[委员会任职代码]高等学校设立的委员会/领导小组中成员任职的分类'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
