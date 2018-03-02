--  DESCRIPTION: 学术会议等级代码
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
DROP TABLE IF EXISTS hb_xshydj;
CREATE EXTERNAL TABLE hb_xshydj (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[学术会议等级代码]学术会议的等级。适用于中小学、中等职业学校和高等学校'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
