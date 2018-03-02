--  DESCRIPTION: 困难程度码表
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
DROP TABLE IF EXISTS hb_kncd;
CREATE EXTERNAL TABLE hb_kncd (
  DM string COMMENT '代码',
  MC string COMMENT '名称',
  SM string COMMENT '说明'
) COMMENT '[困难程度码表]本代码采用二位二层数字编码。第一位表示大类，第二位表示小类。当第一位代码为2时，再细分二个小类。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
