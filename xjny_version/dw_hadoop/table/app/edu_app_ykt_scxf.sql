--公共业务库-4/6

use app;
drop TABLE IF EXISTS edu_app_ykt_scxf;

CREATE EXTERNAL TABLE edu_app_ykt_scxf(
xh               string       comment '学号'
,xfrq            string       comment '消费日期.格式：YYYY-MM-DD'
,zcxfje          double      comment '早餐消费金额，只统计食堂商铺消费；为NULL表示未吃早餐；早餐时间业务定义：如06:00 - 10:00'
,zcxfsj          string       comment '早餐消费时间，有多次刷卡记录的，取第一刷卡的时间'
,wcxfje          double      comment '午餐消费金额，午餐时间业务定义：如10:00 - 16:00'
,wcxfsj          string       comment '午餐消费时间'
,wacxfje         double       comment '晚餐消费金额.晚餐时间业务定义：如16:00 - 22:00'
,wacxfsj         string       comment '晚餐消费时间'
)comment '[三餐消费情况（日维度）]本表存储每个学生入学以来每天的三餐消费情况，如果ZCXFJE（早餐消费金额）、WCXFJE（晚餐消费金额）、WACXFJE（晚餐消费金额）均为NULL表示当天未进餐'
PARTITIONED BY (
  dt string)
row format delimited
fields terminated by '\t'
STORED AS orc
TBLPROPERTIES('orc.compress'='SNAPPY');
