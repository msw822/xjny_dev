--  DESCRIPTION: 港澳台侨外码表
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
DROP TABLE IF EXISTS hb_gatqw;
CREATE EXTERNAL TABLE hb_gatqw (
  DM string COMMENT '代码',
  MC string COMMENT '名称',
  SM string COMMENT '说明'
) COMMENT '[港澳台侨外码表]以此为准'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
