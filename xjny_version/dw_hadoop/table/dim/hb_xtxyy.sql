--  DESCRIPTION: 休退学原因代码
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
DROP TABLE IF EXISTS hb_xtxyy;
CREATE EXTERNAL TABLE hb_xtxyy (
  DM string COMMENT '代码',
  MC string COMMENT '名称',
  JYTJSYXX string COMMENT '教育统计适用学校'
) COMMENT '[休退学原因代码]本代码与“XJYDYY 学籍异动原因代码”有关联'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
