--  DESCRIPTION: 一卡通商户信息表
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
drop table if exists FDM.FDM_YKT_SHXX;
CREATE EXTERNAL TABLE FDM.FDM_YKT_SHXX(
  SHDM string COMMENT '商户代码',
  SHMC string COMMENT '商户名称',
  SHLBDM string COMMENT '商户类别代码',
  SHLBMC string COMMENT '商户类别名称',
  ZCRQ string COMMENT '注册日期YYYYMMDD',
  ZXRQ string COMMENT '注销日期YYYYMMDD',
  YXRQ string COMMENT '有效日期YYYYMMDD',
  SHZT string COMMENT '商户状态'
) COMMENT  '[一卡通商户信息表]商户信息基础表'
PARTITIONED BY (dt string)
row format delimited
fields terminated by '\t'
stored as orc
TBLPROPERTIES('orc.compres'='SNAPPY');

