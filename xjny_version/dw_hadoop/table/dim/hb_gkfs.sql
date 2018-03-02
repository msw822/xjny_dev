--  DESCRIPTION: 公开方式代码
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
DROP TABLE IF EXISTS hb_gkfs;
CREATE EXTERNAL TABLE hb_gkfs (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[公开方式代码]规定公文的公开方式分类。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
