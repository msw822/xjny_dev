--  DESCRIPTION: 家庭关系码
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
DROP TABLE IF EXISTS hb_jtgx;
CREATE EXTERNAL TABLE hb_jtgx (
  DM string COMMENT '名称',
  MC string COMMENT '代码'
) COMMENT '[家庭关系码]本代码引自GB/T 4761-2008'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
