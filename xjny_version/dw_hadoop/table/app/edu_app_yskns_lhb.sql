--疑似家庭困难生-1/1

use app;
drop TABLE IF EXISTS edu_app_yskns_lhb;

CREATE EXTERNAL TABLE edu_app_yskns_lhb(
xh                   string       comment '学号'
,xm                   string       comment '姓名'
,yxdm                string       comment '院系代码'
,yxmc                string       comment '院系名称'
,zydm                string       comment '专业代码'
,zymc                string       comment '专业名称'
,bjdm                string       comment '班级代码'
,bjmc                string       comment '班级名称'
,xznj                string       comment '现在年级'
,xz                  string       comment '学制'
,syd_sf              string       comment '生源地_省份'
,fqsfcj              string       comment '父亲是否残疾，如果为NULL表示父亲未残疾，否则填写残疾情况'
,fqsfsw              string       comment '父亲是否死亡，1、是。2、否'
,mqsfcj              string       comment '母亲是否残疾，如果为NULL表示母亲未残疾，否则填写残疾情况'
,mqsfsw              string       comment '母亲是否死亡，1、是。2、否'
,jtnzsr              double       comment '家庭年总收入'
,zxdkzje             double       comment '助学贷款总金额，如果为NULL表示未贷款，该列数据对原始数据库中的贷款记录进行汇总'
,qjxfje              double       comment '欠缴学费金额，如果为NULL表示不欠费，该列数据对原始数据库中的缴费记录进行汇总'
,sfpk_zp             string       comment '是否贫困_自评，1、是。2、否'
,sfpk_fdy            string       comment '是否贫困_辅导员，1、是。2、否'
,qx_yjjccs           double       comment '全校_月均就餐次数，每次清洗一卡通信息时顺带清洗如下几列'
,yjjccs              double       comment '月均就餐次数'
,qx_yjxf             double       comment '全校_月均消费'
,yjxf                double       comment '月均消费'
,qx_cjxf             double       comment '全校_餐均消费'
,cjxf                double       comment '餐均消费'
,qgjxcs              double       comment '勤工俭学次数，根据社会活动表进行统计次数'
)comment '[疑似家庭困难生量化表]此表除消费情况外其他信息来自入校时的自评登记表'
PARTITIONED BY (
  dt string)
row format delimited
fields terminated by '\t'
STORED AS orc
TBLPROPERTIES('orc.compress'='SNAPPY');
