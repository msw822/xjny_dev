--  DESCRIPTION: 困难学生信息表
--
--     OPTIONS: ---
-- REQUIREMENTS: ---
--        BUGS: ---
--        NOTES: ---
--       AUTHOR: song.shengjie@h3c.com
--     COMPANY: h3c.bigdata
--      VERSION: 1.0
--     CREATED: 2017/08/11
--    REVIEWER:
--    REVISION:
DROP TABLE IF EXISTS FDM.FDM_XS_KNXSXX;
CREATE EXTERNAL TABLE
IF NOT EXISTS FDM.FDM_XS_KNXSXX (
  XH string  COMMENT '学号',
  KNCDDM string COMMENT '困难程度代码，见[hb_kncd]',
  KNPDXN string COMMENT '评定学年,格式：YYYY-YYYY,如:2001-2002',
  KNSFYX string COMMENT '是否有效,1:有效,0:否'
) COMMENT '[困难学生信息表]困难学生维度表,全量更新'
PARTITIONED BY ( 
  dt string)
row format delimited
fields terminated by '\t'
stored as orc
TBLPROPERTIES('orc.compres'='SNAPPY');
