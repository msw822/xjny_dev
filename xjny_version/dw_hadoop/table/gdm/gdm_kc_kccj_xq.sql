--  DESCRIPTION: 课程成绩宽表
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

DROP TABLE IF EXISTS gdm.gdm_kc_kccj_xq;
CREATE EXTERNAL TABLE IF NOT EXISTS gdm.gdm_kc_kccj_xq (
  XQM_MC string COMMENT '学期',
  XM string COMMENT '姓名', 
  XH string COMMENT '学号',
  KCH string COMMENT '课程号',
  KCMC string COMMENT '课程名称',
  KSFSM string COMMENT '考试方式码',
  KSFSM_MC string COMMENT '[hb_ksfs]考试方式名称',
  KSXZM string COMMENT '考试性质码',
  KSXZM_MC string COMMENT '[hb_ksxz]考试性质名称',
  KSXSM string COMMENT '考试形式码',
  KSXSM_MC string COMMENT '[hb_ksxs]考试形式名称',
  PSCJ string COMMENT '平时成绩',
  ZSCJ double COMMENT '折算成绩',
  KCCJ string COMMENT '课程成绩',
  KCCJ_JG double COMMENT '根据ZSCJ、KCCJ的规则JG(jiagong)获得的学分',
  XF double COMMENT '课程表-学分',
  XF_HD double COMMENT '学分获得(根据ZSCJ、KCCJ的规则计算HD(获得))',
  XS double COMMENT '课程表-学时',
  KCSXM string COMMENT '课程属性码：1,2',
  KCSXM_MC string COMMENT '课程属性：必修，选修等',
  PM int COMMENT '成绩排名',
  JD double COMMENT '课程表-绩点',
  XBM string COMMENT '性别码',
  XBM_MC string COMMENT '性别名称',
  JGM string COMMENT '籍贯码',
  JGM_MC string COMMENT '行政区划名称',
  JGM_SM string COMMENT '省名',
  SFZJH string COMMENT '身份证件号',
  XXM string COMMENT '血型码',
  XXM_MC string COMMENT '血型名称',
  SFDSZN string COMMENT '是否独生子女',
  YXXMC string COMMENT '原学校名称',
  RXFSM string COMMENT '入学方式码',
  RXFSM_MC string COMMENT '入学方式名称',
  LYDQM string COMMENT '来源地区码',
  LYDQM_MC string COMMENT '来源地区名称',
  LYDQM_SM string COMMENT '来源地区省名',
  RXNY string COMMENT '入学年月',
  XZ string COMMENT '学制',
  ZYM string COMMENT '专业码',
  ZYM_MC string COMMENT '专业名称',
  SZBH string COMMENT '所在班号',
  BJMC string COMMENT '班级名称',
  SZNJ string COMMENT '所在年级',
  SSXYM string COMMENT '所在院系码',
  PYCCM string COMMENT '培养层次名称',
  PYCCM_MC string COMMENT '培养层次名称'
) COMMENT '课程成绩宽表'
PARTITIONED BY (xn string,
  xqm string)
row format delimited
fields terminated by '\t'
STORED AS orc 
TBLPROPERTIES('orc.compress'='SNAPPY');