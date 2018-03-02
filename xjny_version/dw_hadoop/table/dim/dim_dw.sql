--  DESCRIPTION: 单位维表
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
DROP TABLE IF EXISTS dim_dw;
CREATE EXTERNAL TABLE dim_dw (
  DWH string COMMENT '单位码',
  DWMC string COMMENT '名称',
  DWYWMC string COMMENT '单位英文名称',
  DWYWJC string COMMENT '单位英文简称',
  DWJP string COMMENT '简称',
  DWDZ string COMMENT '单位地址',
  LSDWH string COMMENT '隶属单位号',
  DWLBM string COMMENT '单位类别码',
  DWBBM string COMMENT '单位办别码',
  DWYXBS string COMMENT '单位有效标志,1:有效,0:无效',
  SXRQ string COMMENT '单位失效日期 YYYYMMDD',
  SFST string COMMENT '是否实体',
  JLNY string COMMENT '建立年月',
  DWFZRH string COMMENT '单位负责人号',
  DWJB string COMMENT '单位级别,层次',
  DWXJM string COMMENT '助记码',
  CREATED_TIME string COMMENT '创建时间',
  MODIFIED_TIME string COMMENT '修改时间'
) COMMENT '[单位维表]学校各个单位信息'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
