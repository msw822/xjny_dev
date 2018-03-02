--  DESCRIPTION: 学籍异动原因代码表
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
DROP TABLE IF EXISTS hb_xjydyy;
CREATE EXTERNAL TABLE hb_xjydyy (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[学籍异动原因代码表]本代码采用二层二位数字码，第一位表示大类，第二位表示小类'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
