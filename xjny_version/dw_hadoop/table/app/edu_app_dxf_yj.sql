--低消费预警-1/1

use app;
drop TABLE IF EXISTS edu_app_dxf_yj;

CREATE EXTERNAL TABLE edu_app_dxf_yj(
xh               string       comment '学号'
,xm              string       comment '姓名'
,yxdm            string       comment '院系代码'
,yxmc            string       comment '院系名称，根据院系代码与字典表进行联查'
,zydm            string       comment '专业代码'
,zymc            string       comment '专业名称，根据专业代码与字典表进行联查'
,bjdm            string       comment '班级代码'
,bjmc            string       comment '班级名称，根据班级代码与字典表进行联查'
,xznj            string       comment '现在年级，格式：YYYY'
,sxqyjzxf        double       comment '上学期月均消费额'
,sxqcjxf         double       comment '上学期餐均消费额'
,xz              double       comment '学制'
)comment '[低消费预警]'
PARTITIONED BY (
  dt string)
row format delimited
fields terminated by '\t'
STORED AS orc
TBLPROPERTIES('orc.compress'='SNAPPY');