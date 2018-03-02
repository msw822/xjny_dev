--  DESCRIPTION: 论文基本信息表
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
DROP TABLE IF EXISTS FDM.fdm_ky_lw_attr;
CREATE EXTERNAL TABLE IF NOT EXISTS FDM.fdm_ky_lw_attr (
  LWBH string COMMENT '论文编号',
  LWZWMC string COMMENT '论文中文名',
  LWYWMC string COMMENT '论文英文名',
  DWH string COMMENT '单位号,见[dw_dim]',
  LWLXM string COMMENT '论文类型码,见HDLX活动类型代码表[hb_hdlx]',
  LZLBM string COMMENT '论著类别码,见[hb_lzlb]',
  XKLYM string COMMENT '学科领域码,见[hb_xklb]',
  XKMLKJM string COMMENT '学科门类(科技)码,见[hb_xkml]',
  XMLYM string COMMENT '项目来源码,见[hb_xmly]',
  ZGYZM string COMMENT '中国语种码,见[hb_zgyz]',
  YZM string COMMENT '语种码,见[hb_yz]',
  SSXMBH string COMMENT '所属项目编号',
  SSJSLY string COMMENT '所属技术领域',
  LZSLQKM string COMMENT '论著收录情况码,',
  QTSLQK string COMMENT '其他收录情况',
  SLSJ string COMMENT '收录时间',
  KWMC string COMMENT '刊物名称',
  FBRQ string COMMENT '发表日期',
  CBH string COMMENT '出版号',
  GJDQM string COMMENT '国家/地区码,见[hb_gjdq]',
  KWJBM string COMMENT '刊物级别码,见[hb_kwjb]',
  NH smallint COMMENT '年号',
  JH int COMMENT '卷号',
  QH string COMMENT '期号',
  ZQH string COMMENT '总期号',
  QSYH int COMMENT '起始页号',
  CBSJBM string COMMENT '出版社级别码,见[hb_cjbjb]',
  KWBH string COMMENT '刊物编号',
  KWLXM string COMMENT '刊物类型码',
  ISSN string COMMENT '国际标准期刊号'
) COMMENT '[论文基本信息表]科研主题模型之一'
PARTITIONED BY (dt string)
row format delimited
fields terminated by '\t'
stored as orc
TBLPROPERTIES('orc.compres'='SNAPPY');

