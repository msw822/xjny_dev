--公共业务库-5/6

use app;
drop TABLE IF EXISTS edu_app_mj_zjhd;

CREATE EXTERNAL TABLE edu_app_mj_zjhd(
rq               string       comment '日期,格式：YYYY-MM-DD'
,xh              string       comment '学号'
,xm              string       comment '姓名'
,yxdm            string       comment '院系代码'
,yxmc            string       comment '院系名称，根据院系代码与字典表进行联查'
,zydm            string       comment '专业代码'
,zymc            string       comment '专业名称，根据专业代码与字典表进行联查'
,bjdm            string       comment '班级代码'
,bjmc            string       comment '班级名称，根据班级代码与字典表进行联查'
,xznj            string       comment '现在年级，格式：YYYY'
,xz              double       comment '学制:N'
,zhxfsj          string       comment '最近消费时间:从一卡通消费表中抽取'
,zhmjsj          string       comment '最近门禁时间:从门禁信息表中抽取'
,zhswsj          string       comment '最近上网时间:从网络访问记录表中进行抽取'
)comment '[最近活动时间]'
PARTITIONED BY (
  dt string)
row format delimited
fields terminated by '\t'
STORED AS orc
TBLPROPERTIES('orc.compress'='SNAPPY');
