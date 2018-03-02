--  DESCRIPTION: 学生信息宽表
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

DROP TABLE IF EXISTS GDM.GDM_XS_JBXX_DA;
CREATE EXTERNAL TABLE
IF NOT EXISTS GDM.GDM_XS_JBXX_DA (
  XH string COMMENT '学号',
  XM string COMMENT '姓名',
  XBM string COMMENT '性别码',
  XBM_MC string COMMENT '[hb_xb]性别名称',
  CSRQ string COMMENT '出生日期',
  JGM string COMMENT '籍贯码',
  JGM_MC string COMMENT '[hb_xzqh]行政区划名称',
  JGM_SM string COMMENT '[hb_xzqh]省名',
  MZM string COMMENT '民族码',
  MZM_MC string COMMENT '[hb_mz]民族名称',
  GJDQM string COMMENT '国籍地区码',
  GJDQM_MC string COMMENT '国籍地区名称',
  SFZJLXM string COMMENT '身份证件类型码',
  SFZJM_MC string COMMENT '[HB_SFZJLX]身份证件名称',
  SFZJH string COMMENT '身份证件号',
  HYZKM string COMMENT '婚姻状况码',
  HYZKM_MC string COMMENT '[HB_HYZT]婚姻状况名称',
  XYZJM string COMMENT '信仰宗教码',
  ZYZJM_MC string COMMENT '[HB_XYZJ]信仰宗教名称',
  XXM string COMMENT '血型码',
  XXM_MC string COMMENT '[HB_XX]血型名称',
  SFZJYXQ string COMMENT '身份证件有效期',
  SFDSZN string COMMENT '是否独生子女',
  SFZX string COMMENT '是否在校',
  YXXMC string COMMENT '原学校名称',
  RXFSM string COMMENT '入学方式码',
  RXFSM_MC string COMMENT '[HB_RXFS]入学方式名称',
  LYDQM string COMMENT '来源地区码',
  LYDQM_MC string COMMENT '[hb_xzqh]来源地区名称',
  LYDQM_SM string COMMENT '[hb_xzqh]来源地区省名',
  SYDM string COMMENT '生源地码',
  SYDM_MC string COMMENT '[hb_xzqh]生源地名称',
  SYDM_SM string COMMENT '[hb_xzqh]生源地省份',
  JDFSM string COMMENT '就读方式码',
  JDFSM_MC string COMMENT '[hb_jdfs]就读方式名称',
  LYGBDQM string COMMENT '来源国别地区码',
  LYGBDQM_MC string COMMENT '来源国别地区名称',
  DXWPDW string COMMENT '定向委培单位',
  RXQXLM string COMMENT '入学前学历码',
  RXQXLM_MC string COMMENT '[HB_XL]入学前学历名称',
  RXQXWM string COMMENT '入学前学位码',
  RXQXWM_MC string COMMENT '[HB_XW]入学前学位名称',
  RXNY string COMMENT '入学年月',
  XSLBM string COMMENT '学生类别码',
  XSLBM_MC string COMMENT '[HB_XSLB]学生类别名称',
  XZ string COMMENT '学制',
  ZYM string COMMENT '专业码',
  ZYM_MC string COMMENT '专业名称',
  SZBH string COMMENT '所在班级',
  BJMC string COMMENT '[dim_bjxx]班级名称',
  SZNJ string COMMENT '所在年级',
  XSDQZTM string COMMENT '学籍当前状态码',
  XSDQZTM_MC string COMMENT '[hb_xsdqzt]学籍当前状态名称',
  SSYXM string COMMENT '所属院系码',
  SSYXM_MC string COMMENT '所属院系名称',
  XKMLM string COMMENT '学科门类码',
  XKMLM_MC string  COMMENT '[HB_XKML]学科门类码',
  PYFSM string COMMENT '培养方式码',
  PYFSM_MC string COMMENT '[hb_pyfs]培养方式名称',
  YJFX string COMMENT '研究方向',
  DSH string COMMENT '导师号',
  DSH_XM string COMMENT '导师姓名',
  HDXLFSM string COMMENT '获得学历方式码',
  HDXLFSM_MC string COMMENT '[hb_hdxlfs]获得学历方式名称',
  PYCCM string COMMENT '培养层次名称',
  PYCCM_MC string COMMENT '[hb_pycc]培养层次名称',
  LDFSM string COMMENT '连读方式码',
  LDFSM_MC string COMMENT '连读方式名称',
  LSDWH string COMMENT '[dim_dw]隶属单位号',
  DWLBM string COMMENT '[dim_dw]单位类别码',
  DWJB string COMMENT '[dim_dw]单位级别',
  SSFJH string COMMENT '宿舍房间号',
  ZZMM  string COMMENT '[HB_ZZMM]政治面貌',
  XQH string COMMENT '[FDM_XQXX]校区号',
  XQMC string COMMENT '[FDM_XQXX]校区名称',
  ZP string COMMENT '照片,存的是照片url'
)COMMENT '[GDM_XS_JBXX_DA]学生信息宽表'
PARTITIONED BY ( 
  dt string)
row format delimited
fields terminated by '\t'
STORED AS orc 
TBLPROPERTIES('orc.compress'='SNAPPY');