--  DESCRIPTION: 一卡通交易宽表
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

DROP TABLE IF EXISTS gdm.gdm_ykt_jy_log;
CREATE EXTERNAL TABLE gdm.gdm_ykt_jy_log (
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
  PYCCM string COMMENT '培养层次码',
  PYCCM_MC string COMMENT '培养层次',
  SFZJH string COMMENT '身份证件号',
  CSRQ string COMMENT '出生日期',
  KH string COMMENT '卡号',
  KXL string COMMENT '卡ID(序列号)',
  JYLX string COMMENT '交易类型',
  JYJE double COMMENT '交易金额',
  JYLSH string COMMENT '交易流水号',
  JYRQ string COMMENT '交易日期',
  JYSJ string COMMENT '交易时间戳',
  JYDD string COMMENT '交易地点',
  SHDM string COMMENT '商户编号',
  SHMC string COMMENT '商户名称',
  SHLBDM string COMMENT '商户类别代码',
  SHLBMC string COMMENT '商户类别名称',
  ZDJH string COMMENT 'POS编号',
  LJYKCS int COMMENT '累计刷卡次数',
  JYYE double COMMENT '交易余额',
  LYDQM string COMMENT '学生来源地区码,见中华人民共和国行政区划代码表',
  LYDQM_SM string COMMENT '来源地',
  JGM string COMMENT '籍贯码',
  JGM_SM string COMMENT '籍贯'
) COMMENT '一卡通交易宽表'
PARTITIONED BY ( 
  dt string)
row format delimited
fields terminated by '\t'
STORED AS orc 
TBLPROPERTIES('orc.compress'='SNAPPY');
