--公共业务库-2/6

use app;
drop TABLE IF EXISTS edu_app_ts_jyjl;

CREATE EXTERNAL TABLE edu_app_ts_jyjl(
xh               string       comment '学号'
,jssj            string       comment '借书时间。格式：YYYY-MM-DD HH:mm:ss'
,tsmc            string       comment '图书名称'
,tslx            string       comment '图书类型。备注：具体类型参考学校数据库实际情况'
,gjz             string       comment '关键字。所借图书的特征字，如果没有填充图书类型，如果有多个关键字建议取第一个'
,sfyq            string       comment '是否逾期：是、否'
,yqts            double       comment '逾期天数。计算规则：清洗时间减去这本图书的应还日期'
,jsdd            string       comment '借书地点'
)comment '[图书借阅记录]本表对原始库中的图书记录表进行抽取和规整，存储每个学生每笔借书信息'
PARTITIONED BY (
  dt string)
row format delimited
fields terminated by '\t'
STORED AS orc
TBLPROPERTIES('orc.compress'='SNAPPY');
