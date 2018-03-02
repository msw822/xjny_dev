--疑似失联分析-1/2

use app;
drop TABLE IF EXISTS edu_app_yssl_ssmj;

CREATE EXTERNAL TABLE edu_app_yssl_ssmj(
rq               string       comment '日期,此表需要每日更新，更新日期'
,xh              string       comment '学号'
,xm              string       comment '姓名'
,yxdm            string       comment '院系代码'
,yxmc            string       comment '院系名称，根据院系代码与字典表进行联查'
,zydm            string       comment '专业代码'
,zymc            string       comment '专业名称，根据专业代码与字典表进行联查'
,bjdm            string       comment '班级代码'
,bjmc            string       comment '班级名称，根据班级代码与字典表进行联查'
,xznj            string       comment '现在年级，格式：YYYY'
,ssdm            string       comment '宿舍代码'
,ssmc            string       comment '宿舍名称，根据宿舍代码与字典表进行联查'
,jss_sj          string       comment '进宿舍时间，格式：YYYY-MM-DD HH:mm:ss，每天最后一条进宿舍记录'
,css_sj          string       comment '出宿舍时间，格式：YYYY-MM-DD HH:mm:ss，每天最后一条出宿舍记录'
)comment '[住宿门禁]此表每日更新，每人每天一条记录，只保留最新的进宿舍、出宿舍时间'
PARTITIONED BY (
  dt string)
row format delimited
fields terminated by '\t'
STORED AS orc
TBLPROPERTIES('orc.compress'='SNAPPY');
