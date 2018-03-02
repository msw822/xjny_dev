--  DESCRIPTION: 惩处违章类型信息表
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
drop table if exists fdm.fdm_ccwzlxxx;
CREATE EXTERNAL TABLE fdm.fdm_ccwzlxxx(
  XH string comment '学号',
  SFZJH string comment '身份证件号',
  FKE double comment '罚款额，单位元',
  WZLX string comment '违章类型',
  WJRQ string comment '违纪日期',
  WJJK string comment '违纪简况',
  WJLBM string comment '危机类别码',
  CFMCM string comment '处分名称码',
  CFYY string comment '处分原因',
  CFRQ string comment '处分日期',
  CFWH string comment '处分文号',
  CFCXRQ string comment '处分撤销日期',
  CFCXWH string comment '处分撤销文号',
  SSRQ string comment '申诉日期',
  SWHSYRQ string comment '申委会审议日期',
  SWHSYJL string comment '申委会审议结论'
) comment '[惩处违章类型信息表]关于惩罚的相关信息'
PARTITIONED BY ( 
  dt string)
row format delimited
fields terminated by '\t'
STORED AS orc 
TBLPROPERTIES('orc.compress'='SNAPPY');


