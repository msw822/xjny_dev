--  DESCRIPTION: 食堂餐次维度表
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
DROP TABLE IF EXISTS dim_stcc;
CREATE EXTERNAL TABLE dim_stcc (
  CCDM string COMMENT '代码',
  CCMC string COMMENT '名称',
  ST_TIME string COMMENT '开始时间',
  END_TIME string COMMENT '结束时间',
  ST_DATE string COMMENT '开始日期,YYYYMMDD',
  END_DATE string COMMENT '结束日期,YYYYMMDD'
) COMMENT '[食堂餐次维度表]根据业务自定义。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;