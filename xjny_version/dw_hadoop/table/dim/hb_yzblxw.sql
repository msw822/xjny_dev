--  DESCRIPTION: 严重不良行为代码
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
DROP TABLE IF EXISTS hb_yzblxw;
CREATE EXTERNAL TABLE hb_yzblxw (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
)  COMMENT '[严重不良行为代码]依据《中华人民共和国预防未成年人犯罪法》规定了未成年人严重不良行为的种类'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
