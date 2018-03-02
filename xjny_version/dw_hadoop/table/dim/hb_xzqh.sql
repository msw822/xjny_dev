--  DESCRIPTION: 行政区划
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
DROP TABLE IF EXISTS hb_xzqh;
CREATE EXTERNAL TABLE hb_xzqh (
  XZQH string COMMENT '行政区划代码',
  XZQHMC string COMMENT '行政区划名称',
  XZQHJB string COMMENT '行政区划级别',
  JBMC string COMMENT '行政区划级别名称',
  DSQH string COMMENT '地市级行政区划代码',
  DSMC string COMMENT '地市名称',
  SSQH string COMMENT '省级行政区划代码',
  SM string COMMENT '省名'
)  COMMENT '[行政区划]根据标准生成。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
