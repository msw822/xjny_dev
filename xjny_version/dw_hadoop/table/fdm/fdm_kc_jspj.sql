--  DESCRIPTION: 教师评价表
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
drop table if exists fdm.fdm_kc_jspj;
CREATE EXTERNAL TABLE fdm.fdm_kc_jspj(
  PJNR string COMMENT '评价内容',
  KCH string   COMMENT '课程号',
  XH string  COMMENT '学号',
  XN string COMMENT '学年',
  XQ string  COMMENT '学期',
  ZXS double COMMENT '评教号',
  PJSJ double COMMENT '评教时间',
  DJ string COMMENT '等级',
  PF int  COMMENT '评分',
  JGH string  COMMENT '教工号'  
)COMMENT '[教师评价表]规定了教学评价的基本数据项，和排课表、选课表等有关联。'
PARTITIONED BY ( 
  dt string)
row format delimited
fields terminated by '\t'
STORED AS orc 
TBLPROPERTIES('orc.compress'='SNAPPY');
