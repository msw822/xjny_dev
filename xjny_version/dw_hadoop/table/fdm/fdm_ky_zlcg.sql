--  DESCRIPTION: 专利成果
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
DROP TABLE IF EXISTS FDM.fdm_ky_zlcg;
CREATE EXTERNAL TABLE IF NOT EXISTS FDM.fdm_ky_zlcg(
  ZLCGBH string COMMENT '专利成果编号',
  ZLCGMC string COMMENT '专利成果名称',
  DWH string COMMENT '单位号',
  SQBH string COMMENT '申请编号',
  XKLYM string COMMENT '学科领域码',
  ZLLXM string COMMENT '专利类型码[hb_zllx]',
  PZRQ string COMMENT '批准日期',
  PZXSM string COMMENT '批准形式码',
  ZLZSBH string COMMENT '专利证书编号',
  FLZTM string COMMENT '法律状态码[hb_zlflzt]',
  JNZLNFRQ string COMMENT '交纳专利年费日期',
  JNJE double COMMENT '交纳金额',
  SSXMBH string COMMENT '所属项目编号',
  GJDQM string COMMENT '国籍/地区码[hb_gjdq]',
  GJZLZFLH string COMMENT '国际专利主分类号',
  PCTHZLGJDQM string COMMENT 'PCT 或专利国家/地区码',
  SQGGH string COMMENT '授权公告号',
  SQGGRQ string COMMENT '授权公告日期',
  SQMC string COMMENT '申请名称',
  ZLDLJG string COMMENT '专利代理机构',
  ZLDLR string COMMENT '专利代理人',
  ZLQR string COMMENT '专利权人',
  ZLZZRQ string COMMENT '专利终止日期',
  SQRQ string COMMENT '申请日期',
  FMRS tinyint COMMENT '发明人数',
  XSSM string COMMENT '详细说明'
) COMMENT '[专利成果]fac_ky_zlcg'
PARTITIONED BY (dt string)
row format delimited
fields terminated by '\t'
stored as orc 

TBLPROPERTIES('orc.compres'='SNAPPY');

