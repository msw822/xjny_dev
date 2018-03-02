--  DESCRIPTION: 图书借阅记录宽表
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

DROP TABLE IF EXISTS gdm.gdm_ts_jy_log;
CREATE EXTERNAL TABLE
IF NOT EXISTS gdm.gdm_ts_jy_log (
  TSTM string COMMENT '图书条码',
  TSMC  string COMMENT '图书名称',
  DZTM  string COMMENT '读者条码',
  SFRZH string COMMENT '身份认证号',
  XH string COMMENT '学号、教工号',
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
  JSRQ string COMMENT '结束时间 YYYYMMDD HH:mm:ss',
  YHRQ string COMMENT '归还时间 YYYYMMDD HH:mm:ss',
  DZXM string COMMENT '读者姓名',
  WJSJ string COMMENT '外借时间 YYYYMMDD HH:mm:ss',
  XJCS  tinyint  COMMENT '续借次数',
  CSBM  string COMMENT '库室编码',
  CSMC  string COMMENT '库室名称',
  TSLB string COMMENT '[hb_tslb]图书类别',
  TSLB_MC string COMMENT '[hb_tslb]图书类别名称'   
) COMMENT '图书借阅记录宽表'
PARTITIONED BY ( 
  dt string)
row format delimited
fields terminated by '\t'
STORED AS orc 
TBLPROPERTIES('orc.compress'='SNAPPY');
