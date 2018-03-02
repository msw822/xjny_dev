--  DESCRIPTION: 科研-专利扩展表
--
--     OPTIONS: ---
-- REQUIREMENTS: ---
--        BUGS: ---
--        NOTES: ---
--       AUTHOR: lizhanlei@h3c.com
--     COMPANY: h3c.bigdata
--      VERSION: 1.0
--     CREATED: 2018/02/28
--    REVIEWER:
--    REVISION:

DROP TABLE IF EXISTS gdm.gdm_ky_zl_da;
CREATE EXTERNAL TABLE IF NOT EXISTS gdm.gdm_ky_zl_da(
  ZLCGBH string COMMENT '专利成果编号',
  ZLCGMC string COMMENT '专利成果名称',
  DWH_ZL string COMMENT'单位号-来自专利信息，见[dim_dw]',
  DWMC_ZL string COMMENT'单位名称-来自专利信息',
  SQRQ string COMMENT '申请日期',
  ZLLXM string COMMENT '专利类型码，见[hb_zllx]',
  ZLLXM_MC string COMMENT '专利类型码名称',
  PZRQ string COMMENT '批准日期',
  FMRS tinyint COMMENT '发明人数',
  ZLQR string COMMENT '专利权人',
  XM string COMMENT '专利权人姓名',
  JSM string COMMENT '角色码，见[hb_js]',
  JSM_MC string COMMENT '角色码-名称',
  DWH_RY string COMMENT'单位号-来自人员信息',
  DWMC_RY string COMMENT'单位号-来自人员信息'
) COMMENT '[科研-专利扩展表]来自父表[fdm_ky_zl]'
PARTITIONED BY ( 
  dt string)
row format delimited
fields terminated by '\t'
STORED AS orc 
TBLPROPERTIES('orc.compress'='SNAPPY');