--一卡通

use app;
drop TABLE IF EXISTS edu_app_ykt_rsxfjl;

CREATE EXTERNAL TABLE edu_app_ykt_rsxfjl(
sfrzm               string       comment '身份认证码'
,sflx               string       comment '身份类型'
,xm                 string       comment '姓名'
,xb                 string       comment '性别'
,rsxfsj             string       comment '热水消费时间 消费日期.格式2018-03-09 08:13:17 '
,rsxfdd             string       comment '热水消费地点'
,ysl                double       comment '用水量'
,yssc               string       comment '用水时长'
,xfje               string       comment '消费金额'
)comment '[热水消费记录]本表存储每个师生历史每次热水消费记录'
PARTITIONED BY (
  dt string)
row format delimited
fields terminated by '\t'
STORED AS orc
TBLPROPERTIES('orc.compress'='SNAPPY');


