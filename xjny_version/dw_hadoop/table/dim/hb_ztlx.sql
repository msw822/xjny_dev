--  DESCRIPTION: 载体类型代码
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
DROP TABLE IF EXISTS hb_ztlx;
CREATE EXTERNAL TABLE hb_ztlx (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[载体类型代码]规定档案文件载体的类型。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
