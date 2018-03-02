--  DESCRIPTION: 住宿信息表
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
DROP TABLE IF EXISTS FDM.FDM_XS_ZSXX;
CREATE EXTERNAL TABLE IF NOT EXISTS FDM.FDM_XS_ZSXX (
  XH string COMMENT '学号',
  XQH string COMMENT '校区号,学校自编,参考[dim_xqxx]',
  JZWH string COMMENT '建筑物号,学校自编,宿舍区',
  SSFJH string COMMENT '宿舍房间号',
  CWH string COMMENT '床位号',
  SSDH string COMMENT '宿舍电话',
  RZRQ string COMMENT '入住日期,格式YYYYMMDD',
  QCRQ string COMMENT '迁出日期,格式YYYYMMDD',
  XWZZ string COMMENT '校外住址,指包括省（自治区、直辖市）/地（市、州）/县（区、旗）/乡（镇）/街（村）/门牌号的详细地址',
  ZCDH string COMMENT '住处电话',
  SSQ string COMMENT '宿舍区',
  FPRQ string COMMENT '分配日期,格式YYYYMMDD'
) COMMENT '[住宿信息表]住宿基础表'
PARTITIONED BY ( dt string)
row format delimited
fields terminated by '\t'
stored as orc
TBLPROPERTIES('orc.compres'='SNAPPY');

