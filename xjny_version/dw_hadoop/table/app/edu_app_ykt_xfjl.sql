--公共业务库-3/6

use app;
drop TABLE IF EXISTS edu_app_ykt_xfjl;

CREATE EXTERNAL TABLE edu_app_ykt_xfjl(
sfrzm             string       comment '身份认证码'
,sflx             string       comment '身份类型。1、学生 2、教工 3、后勤 4、临时'
,xm               string       comment '姓名'
,xb               string       comment '性别'
,jysj             string       comment '交易时间.格式：YYYY-MM-DD HH:mm:ss'
,jydd             string       comment '交易地点.通过商铺ID与字典表进行联查转义'
,poscode          string       comment 'POS机编号'
,jylx             string       comment '交易类型.1、消费 2、充值'
,jyje             double       comment '交易金额'
,zhye             double       comment '账户余额'
)comment '[消费记录]本表存储每个学生入学以来每次刷卡记录'
PARTITIONED BY (
  dt string)
row format delimited
fields terminated by '\t'
STORED AS orc
TBLPROPERTIES('orc.compress'='SNAPPY');
