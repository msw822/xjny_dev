--  DESCRIPTION: 鉴定结论代码
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
DROP TABLE IF EXISTS hb_jdjl;
CREATE EXTERNAL TABLE hb_jdjl (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[鉴定结论代码]科研项目等成果的鉴定结论'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
