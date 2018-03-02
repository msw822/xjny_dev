--  DESCRIPTION: 科研-著作宽表
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

DROP TABLE IF EXISTS gdm.gdm_ky_zz_da;
CREATE EXTERNAL TABLE IF NOT EXISTS gdm.gdm_ky_zz_da(
  ZZBH string COMMENT '著作编号,学校统一编写的科技著作序号',
  ZZZWMC string COMMENT '著作中文名称',
  ZZYWMC string COMMENT '著作英文名称',
  DWH_ZZ string COMMENT '单位号，见[dim_dw]',
  DWMC_ZZ string COMMENT '单位名称',
  XKLYM string COMMENT '学科领域码 取其一、二级分类代码，见[hb_xklb]',
  XKLYM_MC string COMMENT '[hb_xmly]学科领域码_名称',
  XMLYM string COMMENT '项目来源码，见[hb_xmly]',
  XMLYM_MC string COMMENT '项目来源码',
  LZLBM string COMMENT '论著类别代码,见[hb_lzlb]',
  LZLBM_MC string COMMENT '论著类别码_名称',
  ZGYZM string COMMENT '中国语种码,GB/T 4881,采用三位数字代码，见[hb_zgyzm]',
  ZGYZM_MC string COMMENT '中国语种码_名称',
  YZM string COMMENT '语种码,GB/T 4880.1，见[hb_zym]',
  YZM_MC string COMMENT '语种码_名称',
  CBS string COMMENT '出版社',
  CBSJBM string COMMENT '出版社级别码，见[hb_cbsjb]',
  CBSJBM_MC string COMMENT '出版社级别码_名称',
  CBRQ string COMMENT '出版日期',
  CBH string COMMENT '出版号',
  ZZZS tinyint COMMENT '著作字数',
  SSXMBH string COMMENT '所属项目编号,GXKY010101,若是某项目的成果，填写该项目编号，否则为空',
  ISBNH string COMMENT 'ISBN 号,JY/T 1002 JCBX040107',
  YJXK string COMMENT '一级学科',
  XXSM string COMMENT '详细说明',
  XM string COMMENT '姓名',
  ZC string COMMENT '职称',
  DWH_RY string COMMENT '单位号',
  DWMC_RY string COMMENT '单位名称',
  GZL double COMMENT '工作量,个人参与项目的工作量比例，单位：％',
  JSM string COMMENT '角色码,JY/T 1001 JS 角色代码',
  JSM_MC string COMMENT '[hb_js]角色码_名称',
  RYLXM string COMMENT '人员类型码,自编',
  RYLXMC string COMMENT '人员类型,学生,校内老师,校外老师'
) COMMENT '[科研-著作宽表]来自父表[fdm_ky_zz]'
PARTITIONED BY ( 
  dt string)
row format delimited
fields terminated by '\t'
STORED AS orc 
TBLPROPERTIES('orc.compress'='SNAPPY');