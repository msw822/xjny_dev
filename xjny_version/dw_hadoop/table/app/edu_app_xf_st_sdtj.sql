--食堂各时段消费统计-1/1

use app;
drop TABLE IF EXISTS edu_app_xf_st_sdtj;

CREATE EXTERNAL TABLE edu_app_xf_st_sdtj(
stbh               string       comment '食堂编号'
,stmc              string       comment '食堂名称'
,yyrq              string       comment '营业日期'
,zcyyje            double       comment '早餐营业金额'
,wcyyje            double       comment '午餐营业金额'
,wacyyje           double       comment '晚餐营业金额'
,qtsdyyje          double       comment '其他时段营业金额'
)comment '[食堂各时段消费统计]'
PARTITIONED BY (
  dt string)
row format delimited
fields terminated by '\t'
STORED AS orc
TBLPROPERTIES('orc.compress'='SNAPPY');
