--  DESCRIPTION: 荣誉信息表-学生教职工
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
DROP TABLE IF EXISTS FDM.FDM_RYXX;
CREATE EXTERNAL TABLE 
IF NOT EXISTS FDM.FDM_RYXX (
  XH string COMMENT '学号/教工号',
  XN string COMMENT '学年(度),格式：YYYY-YYYY,如:2001-2002',
  SFZJH string COMMENT '身份证件号',
  XM string COMMENT '姓名',
  YWXM string COMMENT '英文姓名',
  XBM string COMMENT '性别码 见HB性别表[hb_xb]',
  CSRQ string COMMENT '出生日期,格式YYYY-MM-DD',
  GJDQM string COMMENT '国籍/地区码 见表[hb_gjdq]',
  RYCHLB string COMMENT '荣誉称号类别',
  RYXUH bigint COMMENT '荣誉序号',
  ZBM string COMMENT '洲别码',
  ZWM string COMMENT '职务码',
  XX string COMMENT '学衔',
  GZDW string COMMENT '工作单位',
  TJDW string COMMENT '推荐单位',
  SYZCM string COMMENT '授予职称码,见专业技术职务代码自GB/T 8561-2001',
  SYCH string COMMENT '授予称号',
  SYRQ string COMMENT '授予日期格式：YYYYMMDD如20060412',
  SYQX string COMMENT '授予期限YYYYMMDD-YYYYMMDD',
  GWTXDZ string COMMENT '国外通信地址',
  DH string COMMENT '电话',
  CZDH string COMMENT '传真电话',
  YDDH string COMMENT '移动电话',
  DZXX string COMMENT '电子信箱,电子邮件地址',
  PZRYH string COMMENT '批准人员号',
  DKZYM string COMMENT '对口专业码,见学科分类与代码表[hb_xklb]',
  XNLXRYH string COMMENT '校内联系人员号',
  PSBH string COMMENT '聘书编号',
  HZLS string COMMENT '合作历史',
  WLHZJH string COMMENT '未来合作计划',
  RYBZ string COMMENT '荣誉备注'
) COMMENT '[荣誉信息表-学生教职工]关于教师或者学生获得相关荣誉的信息'
PARTITIONED BY (dt string)
row format delimited
fields terminated by '\t'
stored as orc
TBLPROPERTIES('orc.compres'='SNAPPY');

