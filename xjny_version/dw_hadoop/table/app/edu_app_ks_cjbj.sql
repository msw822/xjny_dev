--学业预警-3/4

use app;
drop TABLE IF EXISTS edu_app_ks_cjbj;

CREATE EXTERNAL TABLE edu_app_ks_cjbj(
xh                 string       comment '学号',
,xq                string       comment '开学学期，默认-上学期（第一学期一般9月初至次年1月底），下学期（第二学期，次年2月初至6月底)'
,pjcj              double       comment '本人平均成绩'
,bjpjcj            double       comment '班级平均成绩'
)comment '[班级平均成绩]'
PARTITIONED BY (xn string,
  xqm string)
row format delimited
fields terminated by '\t'
STORED AS orc
TBLPROPERTIES('orc.compress'='SNAPPY');
