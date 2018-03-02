--  DESCRIPTION: 角色代码
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
DROP TABLE IF EXISTS hb_js;
CREATE EXTERNAL TABLE hb_js (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[角色代码]采用三层三位数字码，第一位表示大类，第二位表示中类，第三位表示小类。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
