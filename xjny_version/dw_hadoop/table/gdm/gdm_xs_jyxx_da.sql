--  DESCRIPTION: 就业信息宽表
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

DROP TABLE IF EXISTS gdm.gdm_xs_jyxx_da;
CREATE EXTERNAL TABLE gdm.gdm_xs_jyxx_da (
  XH string COMMENT '学号',
  XM string COMMENT '姓名',
  XBM string COMMENT '性别码',
  XBM_MC string COMMENT '性别',
  RXNY string COMMENT '入学年月',
  SZNJ string COMMENT '所在年级',
  SZBH string COMMENT '所在班号',
  BJMC string COMMENT '班级名称',
  ZYM string COMMENT '专业码',
  ZYM_MC string COMMENT '专业名称',
  SSYXM string COMMENT '所属院校码',
  SSYXM_MC string COMMENT '所属院校',
  BYNF string COMMENT '毕业年份',
  JYLX string COMMENT '就业类型(留学/升学/参加工作/未就业)',
  JYDD string COMMENT '就业地点',
  JYXZ double COMMENT '就业薪资',
  ZYSFDK string COMMENT '专业是否对口',
  XZSFMY string COMMENT '薪资是否满意'
) COMMENT '[就业信息宽表]'
PARTITIONED BY (dt string)
row format delimited
fields terminated by '\t'
STORED AS orc 
TBLPROPERTIES('orc.compress'='SNAPPY');
