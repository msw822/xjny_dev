--  DESCRIPTION: 仪器现状代码
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
DROP TABLE IF EXISTS hb_yqxz;
CREATE EXTERNAL TABLE hb_yqxz (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[仪器现状代码]规定仪器设备现状的分类。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
