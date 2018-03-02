--  DESCRIPTION: 奖励获得信息表
--
--     OPTIONS: ---
-- REQUIREMENTS: ---
--        BUGS: ---
--        NOTES: ---
--       AUTHOR: song.shengjie@h3c.com
--     COMPANY: h3c.bigdata
--      VERSION: 1.0
--     CREATED: 2017/08/11
--    REVIEWER:
--    REVISION:
drop table if exists fdm.fdm_jzg_jbxx;
CREATE EXTERNAL TABLE fdm.fdm_jzg_jbxx(
  GH string comment '工号' ,
  DWH string comment '单位号',
  XM string comment '姓名',
  YWXM string comment '英文姓名',
  XMPY string comment '姓名拼音',
  CYM string comment '曾用名',
  XBM string comment '性别码',
  CSRQ double comment '出生日期',
  CSDM string comment '出生地码',
  JGM string comment '籍贯码',
  MZM string comment '民族码',
  GJDQM string comment '国际/地区码',
  SFZJLXM string comment '身份证件类型码',
  SFZJH string comment '身份证件号',
  HYZKM string comment '婚姻状况码',
  GATQWM string comment '港澳台侨外码' ,
  ZZMMM string comment '政治面貌码',
  JKZKM string comment '健康状状况码',
  XYZJM string comment '信仰宗教码',
  XXM string comment '血型码',
  ZP string comment '照片',
  SFZJYXQ string comment '身份证件有效期',
  XQH string comment '校区号',
  ZGXLM string comment '最高学历码',
  WHCDM string comment '文化程度码',
  CJGZNY string comment '参加工作年月',
  LXRQ string comment '来校日期',
  QXRQ string comment '起薪日期' ,
  CJNY string comment '从教年月',
  BZLBM string comment '编制类别码',
  JZGLBM string comment '教职工类别码',
  RKZKM string comment '任课状况代码',
  DABH string comment '档案编号',
  DAWB string comment '档案文本',
  DQZTM string comment '当前状态码',
  TC string comment '特长',
  XKLBM string comment '学科类别码',
  YJXKM string comment '一级学科码',
  EJXKM string comment '二级学科码',
  YJFX string comment '研究方向',
  ZC string comment '职称'
) comment '[奖励获得信息表]关于奖励的类型、原因、时间等信息'
PARTITIONED BY ( 
  dt string)
row format delimited
fields terminated by '\t'
STORED AS orc 
TBLPROPERTIES('orc.compress'='SNAPPY');
