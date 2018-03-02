--  DESCRIPTION: 项目来源代码
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
DROP TABLE IF EXISTS hb_xmly;
CREATE EXTERNAL TABLE hb_xmly (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[项目来源代码]本代码代替2002年的DM-XMLY《项目来源代码》'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
