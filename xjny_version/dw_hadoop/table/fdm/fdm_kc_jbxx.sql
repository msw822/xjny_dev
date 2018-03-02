--  DESCRIPTION: 课程基本信息
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
drop table if exists fdm.fdm_kc_jbxx;
CREATE EXTERNAL TABLE fdm.fdm_kc_jbxx(
  KCH string COMMENT '课程号',
  KCMC string   COMMENT '课程名称',
  KCYWMC string  COMMENT '课程英文名称',
  XF double COMMENT '学分',
  ZHXS string  COMMENT '周学时',
  ZXS double COMMENT '总学时',
  LLXS double COMMENT '理论学时',
  SYXS double COMMENT '实验学时',
  KCJJ string  COMMENT '课程简介',
  JC string  COMMENT '教材',
  CKSM string  COMMENT '参考书目',
  KCFZRH string  COMMENT '课程负责人号',
  KCKSDWH string  COMMENT '课程开设单位号',
  SJXS string  COMMENT '实践学时',
  KCZX string  COMMENT '课程性质'
)COMMENT  '[课程基本信息]课程基础表'
PARTITIONED BY (
  dt string)
row format delimited
fields terminated by '\t'
STORED AS orc 
TBLPROPERTIES('orc.compress'='SNAPPY');
