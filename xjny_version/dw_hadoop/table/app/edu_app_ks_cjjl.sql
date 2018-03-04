--学业预警-2/3

use app;
drop TABLE IF EXISTS edu_app_ks_cjjl;

CREATE EXTERNAL TABLE edu_app_ks_cjjl(
xh                 string       comment '学号'
,xq                string       comment '开学学期，默认-上学期（第一学期一般9月初至次年1月底），下学期（第二学期，次年2月初至6月底)'
,kch               string       comment '课程号，课程的唯一标识'
,kcmc              string       comment '通过课程号与课程表进行联查转义'
,kclx              string       comment '课程类型，1：必修课，2：选修课'
,kcxf                double      comment '学分'
,kscj              double      comment '考试成绩，需要根据业务定义，在ods->fdm处理'
,cjlx              string       comment '考试性质，如 01：正常考试，01：缓考'
)comment '[考试记录表]本表对原始库中的考试记录表进行抽取和调整，存储每个学生入学以来每次考试成绩信息'
PARTITIONED BY (xn string,
  xqm string)
row format delimited
fields terminated by '\t'
STORED AS orc
TBLPROPERTIES('orc.compress'='SNAPPY');
