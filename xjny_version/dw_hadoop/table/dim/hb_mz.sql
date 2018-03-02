--  DESCRIPTION: 民族码表
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
DROP TABLE IF EXISTS hb_mz;
CREATE EXTERNAL TABLE hb_mz (
  DM string COMMENT '代码',
  MC string COMMENT '民族名称',
  ZMDM string COMMENT '名族拼音代码'
)  COMMENT '[民族码表]本代码引自GB/T 3304-1991。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
