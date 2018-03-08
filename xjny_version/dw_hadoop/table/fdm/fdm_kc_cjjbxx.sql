--  DESCRIPTION: 课程成绩基本信息
--
--     OPTIONS: ---
-- REQUIREMENTS: ---
--        BUGS: ---
--        NOTES: ---
--       AUTHOR: li.zhanlei@h3c.com
--     COMPANY: h3c.bigdata
--      VERSION: 1.0
--     CREATED: 2017/08/11
--    REVIEWER:
--    REVISION:
drop table if exists fdm.fdm_kc_cjjbxx;
CREATE EXTERNAL TABLE fdm.fdm_kc_cjjbxx(
  KSRQ string comment '考试日期',
  XH string comment '学号',
  KCH string comment '课程号',
  PSCJ string comment '平时成绩',
  KSFSM string comment '考试方式码',
  KSXZM string comment '考试性质码',
  KSXSM string comment '考试形式码',
  FSLKSCJ string comment '分数类考试成绩',
  DJLKSCJ string comment '等级类考试成绩',
  KCCJ string comment '课程成绩',
  ZSCJ string comment '折算成绩',
  KCCJ_JG string comment '根据KCCJ和ZSCJ规则计算获得的学分',
  KCDJCJM string comment '课程等级成绩码',
  RKJSGH string comment '任课教师工号' ,
  CJLRRQ string comment '成绩录入日期',
  CJLRSJ string comment '成绩录入时间',
  QZCJ string comment '期中成绩',
  QMCJ string comment '期末成绩',
  SYCJ string comment '实验成绩',
  BJH_KC string comment '班级代码关联课程表获得的',
  JXBH string comment '教学班号',
  ZYM_XS string comment '专业码，关联学生得到的',
  SZYXM_XS string comment '所在院系码',
  ZYM_KC string comment '专业码',
  XF string comment '学分',
  XF_HD string comment '获得的学分' ,
  XS string comment '学时',
  JD string comment '绩点',
  KCXZM string comment '课程性质码',
  KCSXM string comment '课程属性，又名课程类别码',
  KCGSM string comment '课程归属码',
  PM int comment '排名'
) comment '[课程成绩基本信息]课程成绩基本信息表，同一学生同一课程可能会有多条记录'
PARTITIONED BY (xn string,
  xqm string)
row format delimited
fields terminated by '\t'
STORED AS orc 
TBLPROPERTIES('orc.compress'='SNAPPY');
