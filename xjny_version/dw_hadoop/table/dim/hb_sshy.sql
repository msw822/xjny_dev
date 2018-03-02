--  DESCRIPTION: 所属行业码
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
DROP TABLE IF EXISTS hb_sshy;
CREATE EXTERNAL TABLE hb_sshy (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[所属行业码]本码表为国民经济行业分类代码，引用自GB/T 4754-2011，只包含大类。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
