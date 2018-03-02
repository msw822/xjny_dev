-- 学业预警-1/3
--  DESCRIPTION: 课程类型代码
--
--     OPTIONS: ---
-- REQUIREMENTS: ---
--        BUGS: ---
--        NOTES: ---
--       AUTHOR: song.shengjie@h3c.com
--     COMPANY: h3c.bigdata
--      VERSION: 1.0
--     CREATED: 2017/08/18
--    REVIEWER:
--    REVISION: ---
use app;
drop TABLE IF EXISTS edu_app_kc_kcap;

CREATE EXTERNAL TABLE edu_app_kc_kcap(
kcxn               string       comment '开课学年，格式：YYYY，学校的教学年度从秋季开始到次年夏季为一年'
,kkxq              string       comment '开学学期，默认-上学期（第一学期一般9月初至次年1月底），下学期（第二学期，次年2月初至6月底）',
kch                string       comment '课程号'
,kcmc              string       comment '课程名称'
,kclx              string       comment '课程类型，1：必修课，2：选修课'
,xf                double      comment '学分'
,xs                double      comment '学时'
)comment '[课程安排表]本表存储每学期的课程安排'
PARTITIONED BY (xn string,
  xqm string)
row format delimited
fields terminated by '\t'
STORED AS orc
TBLPROPERTIES('orc.compress'='SNAPPY');