--  DESCRIPTION: 论文刊物发表信息
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
DROP TABLE IF EXISTS FDM.fdm_ky_lwfb;
CREATE EXTERNAL TABLE FDM.fdm_ky_lwfb (
  KWMC string  COMMENT '刊物名称',
  FBRQ string  COMMENT '发表日期',
  CBH string  COMMENT '出版号',
  GJDQM string  COMMENT '国家/地区码JY/T 1002 JCTB020110,见[hb_gjdq]',
  KWJBM string  COMMENT 'KWJB刊物级别代码,JY/T 1001,见[hb_kwjb]',
  NH smallint  COMMENT '年号',
  JH int  COMMENT '卷号',
  QH string  COMMENT '期号',
  ZQH string  COMMENT '总期号',
  QSYH int  COMMENT '起始页号,论文在发表刊物中的起始页数，单位：页',
  CBSJBM string  COMMENT '出版社级别码,见[hb_cbsjb]',
  KWBH string  COMMENT '刊物编号,JY/T 1002  JCBX040201',
  KWLXM string  COMMENT '刊物类型码,JY/T 1002 JCBX040217',
  LWBH string  COMMENT '论文编号',
  ISSN string  COMMENT '国际标准期刊号'
) COMMENT '[论文刊物发表信息]科研主题信息之一'
PARTITIONED BY (dt string)
row format delimited
fields terminated by '\t'
stored as orc
TBLPROPERTIES('orc.compres'='SNAPPY');

