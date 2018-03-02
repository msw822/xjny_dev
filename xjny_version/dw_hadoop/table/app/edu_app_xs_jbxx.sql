--公共业务库-1/6

use app;
drop TABLE IF EXISTS edu_app_xs_jbxx;

CREATE EXTERNAL TABLE edu_app_xs_jbxx(
xh               string       comment '学号'
,xm              string       comment '姓名'
,xb              string       comment '性别：男、女'
,mz              string       comment '民族'
,zjxy            string       comment '宗教信仰,此信息来自入校时的登记调查表'
,jg_gj           string       comment '籍贯_国籍'
,jg_sf           string       comment '籍贯_省份'
,jg_cs           string       comment '籍贯_城市'
,jg_qx           string       comment '籍贯_区县'
,jtzz            string       comment '家庭住址'
,csrq            string       comment '出生日期YYYY-MM-DD'
,sfzh            string       comment '身份证号'
,hklx            string       comment '户口类型.1、农业 2、非农'
,zzmm            string       comment '政治面貌:八个民主党派全称、群众'
,rxrq            string       comment '入学日期YYYY-MM-DD'
,xjzt            string       comment '学籍状态'
,zslx            string       comment '招生类型'
,xxdm            string       comment '学校代码'
,yxdm            string       comment '院系代码'
,yxmc            string       comment '院系名称，根据院系代码与字典表进行联查'
,zydm            string       comment '专业代码'
,zymc            string       comment '专业名称，根据专业代码与字典表进行联查'
,bjdm            string       comment '班级代码'
,bjmc            string       comment '班级名称，根据班级代码与字典表进行联查'
,ssdm            string       comment '宿舍代码'
,ssmc            string       comment '宿舍名称,根据宿舍代码与字典表进行联查'
,xznj            string       comment '现在年级，格式：YYYY'
,xz              double       comment '学制:N'
,xl              string       comment '学历:本、硕、博、研'
,syd_gj          string       comment '生源地_国籍'
,syd_sf          string       comment '生源地_省份'
,syd_cs          string       comment '生源地_城市'
,syd_qx          string       comment '生源地_区县'
,byzx            string       comment '毕业中学'
,lxdh            string       comment '联系电话:手机号码'
,yxdz            string       comment '邮箱地址'
,wxh             string       comment '微信号'
,jzlxdh          string       comment '家长联系电话:手机号码'
)comment '[学生基本信息]本表只存储在校生信息'
PARTITIONED BY (
  dt string)
row format delimited
fields terminated by '\t'
STORED AS orc
TBLPROPERTIES('orc.compress'='SNAPPY');
