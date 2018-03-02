--  DESCRIPTION: 上网信息表gdm
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
DROP TABLE IF EXISTS gdm.gdm_sw_log;
CREATE EXTERNAL TABLE
IF NOT EXISTS gdm.gdm_sw_log(
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
  LOGIN_TIME string COMMENT '上网开始时间',
  LOGOUT_TIME string COMMENT '上网结束时间',
  TIME_LONG int COMMENT '上网总时长'
) COMMENT '上网信息表gdm'
PARTITIONED BY ( 
  dt string)
row format delimited
fields terminated by '\t'
STORED AS orc 
TBLPROPERTIES('orc.compress'='SNAPPY');
