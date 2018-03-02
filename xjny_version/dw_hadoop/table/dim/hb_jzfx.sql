--  DESCRIPTION: 记账方向代码
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
DROP TABLE IF EXISTS hb_jzfx;
CREATE EXTERNAL TABLE hb_jzfx (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[记账方向代码]高等学校财务凭证记账方向的分类'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
