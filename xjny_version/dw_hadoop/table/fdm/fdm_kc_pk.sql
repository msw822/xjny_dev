--  DESCRIPTION: 排课数据表
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
DROP TABLE IF EXISTS fdm.fdm_kc_pk;
CREATE EXTERNAL TABLE IF NOT EXISTS fdm.fdm_kc_pk (
  JXBH string COMMENT '教学班号',
  KCKSDWH string COMMENT '课程开设单位号',
  KKXND string COMMENT '开课学年度',
  KKXQM string COMMENT '开课学期码',
  SKSJ string  COMMENT '上课时间，格式yyyy-mm-dd hh:mm:ss',
  JXDD string COMMENT '教学地点',
  JXZY string COMMENT '教学资源',
  KRL int COMMENT '课容量',
  XDRS int COMMENT '修读人数',
  JSSZXQH string COMMENT '教室所在学区号',
  XKXQH string COMMENT '选课学区号',
  XKRSXD int COMMENT '选课人数限定',
  XKNJ string COMMENT '选课年级',
  PKYQ string COMMENT '排课要求',
  JSLXM string COMMENT '教师类型码',
  QSZ int COMMENT '起始周',
  ZZZ int COMMENT '终止周',
  JSGH string COMMENT '教师工号',
  JSXM string COMMENT '教师姓名',
  KCXZM string COMMENT '课程性质码',
  SKBJH string COMMENT '上课班级号', 
  JXBMC string  COMMENT '教学班名称',
  JXTZ string COMMENT '教学特征',
  KKSM  string COMMENT '开课说明'
)  COMMENT '[排课数据表]排课--为分教学班授课课程的编排。'
PARTITIONED BY ( 
  dt string)
row format delimited
fields terminated by '\t'
STORED AS orc 
TBLPROPERTIES('orc.compress'='SNAPPY');
