--  DESCRIPTION: 文献保密等级码表
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
DROP TABLE IF EXISTS hb_bmdj;
CREATE EXTERNAL TABLE hb_bmdj (
  DM string COMMENT '代码',
  HYPYDM string COMMENT '汉语拼音代码',
  HZDM string COMMENT '汉语代码',
  MC string COMMENT '名称'
) COMMENT '[文献保密等级码表]保密等级'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
