--  DESCRIPTION: 班级信息表
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
DROP TABLE IF EXISTS dim_bjxx;
CREATE EXTERNAL TABLE dim_bjxx (
  BH string COMMENT '班号',
  BJMC string COMMENT '班级名称',
  BJJC string COMMENT '班级简称',
  JBNY string COMMENT '建班年月 格式YYYY-MM-DD',
  SSNJ string COMMENT '所属年级',
  BZRGH string COMMENT '班主任工号',
  BZXH string COMMENT '班长学号',
  FDYH string COMMENT '辅导员号',
  SFDDB string COMMENT '是否订单班,本数据项只适用于高职院校,1是,0:否',
  SSYXM string COMMENT '所属学院码,见[dim_dw]',
  SSYCMC string COMMENT '所属学院名称',
  SSZYM string COMMENT '（所属)专业号,学校自编,见[dim_zyxx]',
  SSZYMC string COMMENT '所属专业名称',
  RZND string COMMENT '入学年份,YYYYMM',
  XN string COMMENT '学年(度),格式：YYYY-YYYY,如:2001-2002',
  XZ string COMMENT '学制',
  CREATED_TIME string COMMENT '创建时间',
  MODIFIED_TIME string COMMENT '修改时间'
) COMMENT '[班级信息表]本数据类规定了有关（行政）班级的基本数据项'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
