--学业预警-3/4

use app;
drop TABLE IF EXISTS edu_app_ks_cjxq;

CREATE EXTERNAL TABLE edu_app_ks_cjxq(
xh string COMMENT '学号'
,xq string COMMENT '学期'
,kclx string COMMENT '课程类型'
,gksl double COMMENT '本学期挂科数量'
,bxq_gkxf float COMMENT '本学期挂科学分'
,bxq_jqpjf float COMMENT '本学期必修课加权平均分'
,zgdfkcm string COMMENT '本学期最高得分课程名'
,zgdffs double COMMENT '本学期最高得分分数'
,bxq_bksl double COMMENT '本学期补考通过数量'
,bxq_bkxf double COMMENT '本学期补考通过学分'
)comment '[学期平均成绩]'
PARTITIONED BY (xn string,
  xqm string)
row format delimited
fields terminated by '\t'
STORED AS orc
TBLPROPERTIES('orc.compress'='SNAPPY');
