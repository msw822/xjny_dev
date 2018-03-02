--  DESCRIPTION: 公文状态代码
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
DROP TABLE IF EXISTS hb_gwzt;
CREATE EXTERNAL TABLE hb_gwzt (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[公文状态代码]规定高等学校在办公流程中公文的当前办理状态分类。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
