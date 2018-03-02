--  DESCRIPTION: 教职工当前状态代码
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
DROP TABLE IF EXISTS hb_jzgdqzt;
CREATE EXTERNAL TABLE hb_jzgdqzt (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[教职工当前状态代码]'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
