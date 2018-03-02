--  DESCRIPTION: 科研论著信息
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
-- 
DROP TABLE IF EXISTS FDM.fdm_ky_zz;
CREATE EXTERNAL TABLE IF NOT EXISTS FDM.fdm_ky_zz (
  ZZBH string COMMENT '著作编号,学校统一编写的科技著作序号',
  ZZZWMC string COMMENT '著作中文名称',
  ZZYWMC string COMMENT '著作英文名称',
  DWH string COMMENT '单位号',
  XKLYM string COMMENT '学科领域码 取其一、二级分类代码[hb_xklb]',
  XMLYM string COMMENT '项目来源码[hb_xmly]',
  LZLBM string COMMENT '论著类别码,JY/T 1001 LZLB 论著类别代码[hb_lzlb]',
  ZGYZM string COMMENT '中国语种码,GB/T 4881,采用三位数字代码[hb_zgyz]',
  YZM string COMMENT '语种码,GB/T 4880.1[hb_yz]',
  CBS string COMMENT '出版社',
  CBSJBM string COMMENT '出版社级别码[hb_cbsjb]',
  CBRQ string COMMENT '出版日期',
  CBH string COMMENT '出版号',
  ZZZS tinyint COMMENT '著作字数',
  SSXMBH string COMMENT '所属项目编号,GXKY010101,若是某项目的成果，填写该项目编号，否则为空',
  ISBNH string COMMENT 'ISBN 号,JY/T 1002 JCBX040107',
  YJXK string COMMENT '一级学科',
  XXSM string COMMENT '详细说明'
) COMMENT '[科研论著信息]科研论著信息'
PARTITIONED BY (dt string)
row format delimited
fields terminated by '\t'
stored as orc
TBLPROPERTIES('orc.compres'='SNAPPY');

