--  DESCRIPTION: 各级地区
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
DROP TABLE IF EXISTS hb_gjdq;
CREATE EXTERNAL TABLE hb_gjdq (
  DM string COMMENT '代码',
  MC string COMMENT '名称',
  EZMDM string COMMENT '二字母代码',
  SZMDM string COMMENT '三字母代码'
)COMMENT '[各级地区]'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
