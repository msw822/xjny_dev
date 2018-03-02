--  DESCRIPTION: 图书借阅记录表
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
DROP TABLE IF EXISTS FDM.fdm_ts_jy_log;
CREATE EXTERNAL TABLE
IF NOT EXISTS FDM.fdm_ts_jy_log (
  TSTM string COMMENT '图书条码',
  TSMC string COMMENT '图书名称',
  DZTM string COMMENT '读者条码',
  SFRZH string COMMENT '身份认证号',
  JSRQ string COMMENT '结束时间 YYYYMMDD HH:mm:ss',
  YHRQ string COMMENT '归还时间 YYYYMMDD HH:mm:ss',
  DZXM string COMMENT '读者姓名',
  WJSJ string COMMENT '外借时间 YYYYMMDD HH:mm:ss',
  XJCS double COMMENT '续借次数',
  CSBM string COMMENT '库室编码',
  CSMC string COMMENT '库室名称'
) COMMENT '[图书借阅记录表]'
PARTITIONED BY (dt string)
row format delimited
fields terminated by '\t'
stored as orc
TBLPROPERTIES('orc.compres'='SNAPPY');

