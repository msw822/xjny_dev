--  DESCRIPTION: 政治面貌码
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
DROP TABLE IF EXISTS hb_zzmm;
CREATE EXTERNAL TABLE hb_zzmm (
  DM string COMMENT '代码',
  MC string COMMENT '名称',
  JC string COMMENT '简称'
)  COMMENT '[政治面貌码]本代码引自GB/T 4762-1984。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
