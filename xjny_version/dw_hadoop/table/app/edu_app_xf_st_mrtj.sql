--食堂每日消费统计-1/1

use app;
drop TABLE IF EXISTS edu_app_xf_st_mrtj;

CREATE EXTERNAL TABLE edu_app_xf_st_mrtj(
rq               string       comment '日期'
,xfze            double       comment '消费总额'
,rjxfe           double       comment '人均消费额'
)comment '[食堂每日消费统计]'
PARTITIONED BY (
  dt string)
row format delimited
fields terminated by '\t'
STORED AS orc
TBLPROPERTIES('orc.compress'='SNAPPY');
