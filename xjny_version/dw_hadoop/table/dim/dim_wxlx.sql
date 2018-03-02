--  DESCRIPTION: 文献类型代码
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
DROP TABLE IF EXISTS dim_wxlx;
CREATE EXTERNAL TABLE dim_wxlx (
  DM string COMMENT '序号',
  MC string COMMENT '名称',
  JC string COMMENT '简称',
  SZM string COMMENT '双子码',
  DZM string COMMENT '单子码'
) COMMENT '[文献类型代码]本代码引自GB/T 3469-1983'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
