--  DESCRIPTION: 仪器使用方向代码
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
DROP TABLE IF EXISTS hb_yqsyfx;
CREATE EXTERNAL TABLE hb_yqsyfx (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[仪器使用方向代码]规定仪器设备使用方向的分类。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
