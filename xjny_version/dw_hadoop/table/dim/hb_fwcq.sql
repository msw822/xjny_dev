--  DESCRIPTION: 房屋产权
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
DROP TABLE IF EXISTS hb_fwcq;
CREATE EXTERNAL TABLE hb_fwcq (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[房屋产权]规定师生员工居住房屋的产权分类。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
