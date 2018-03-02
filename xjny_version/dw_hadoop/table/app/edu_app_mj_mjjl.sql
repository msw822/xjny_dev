--公共业务库-6/6

use app;
drop TABLE IF EXISTS edu_app_mj_mjjl;

CREATE EXTERNAL TABLE edu_app_mj_mjjl(
xh              string       comment '学号'
,sksj           string       comment '刷卡时间.格式：YYYY-MM-DD HH:mm:ss'
,skdd           string       comment '刷卡地点.门禁地点，如教学楼、宿舍等'
,lx             string       comment '类型.1、进 2、出'
)comment '[门禁记录]本表存储每个学生入学以来的门禁记录'
PARTITIONED BY (
  dt string)
row format delimited
fields terminated by '\t'
STORED AS orc
TBLPROPERTIES('orc.compress'='SNAPPY');
