--  DESCRIPTION: 教职工信息扩展表
--
--     OPTIONS: ---
-- REQUIREMENTS: ---
--        BUGS: ---
--        NOTES: ---
--       AUTHOR: lizhanlei@h3c.com
--     COMPANY: h3c.bigdata
--      VERSION: 1.0
--     CREATED: 2018/02/28
--    REVIEWER:
--    REVISION:

DROP TABLE IF EXISTS gdm.gdm_jzg_da;
CREATE EXTERNAL TABLE gdm.gdm_jzg_da (
  GH string COMMENT '工号',
  DWH string COMMENT '单位号',
  DWMC string ,
  XM string COMMENT '姓名',
  YWXM string COMMENT '英文姓名',
  XMPY string COMMENT '姓名拼音',
  CYM string COMMENT '曾用名',
  XBM string COMMENT ' 性别码，见[hb_xb]',
  XBM_MC string COMMENT '性别码_名称',
  CSRQ string COMMENT '出生日期',
  CSDM string COMMENT '出生地码,见[hb_xzqh]',
  CSDM_MC string COMMENT '出生地码_名称',
  CSDM_SM string COMMENT '出生地——省名',
  JGM string COMMENT '籍贯码,见[hb_xzqh]',
  JGM_MC string COMMENT '籍贯码_名称',
  JGM_SM string COMMENT '籍贯_省名',
  MZM string COMMENT '民族码,见[hb_mz]',
  MZM_MC string COMMENT '民族码_名称',
  GJDQM string COMMENT '国籍/地区,见[hb_gjdq]',
  GJDQM_MC string COMMENT '国家/地区_名称',
  SFZJLXM string COMMENT '身份证件类型,见[hb_sfzjlx]',
  SFZJLXM_MC string COMMENT '身份证件类型_名称',
  SFZJH string COMMENT '身份证件号',
  HYZTM string COMMENT '婚姻状况码，见[hb_hyzk]',
  HYZTM_MC string COMMENT '婚姻状况码_名称',
  GATQWM string COMMENT '港澳台侨外码，见[hb_gatqw]',
  GATQWM_MC string COMMENT '港澳台侨外码_名称',
  ZZMMM string COMMENT '政治面貌码,见[hb_zzmm]',
  ZZMMM_MC string COMMENT '政治面貌码_名称',
  JKZKM string COMMENT '健康状况码，见[hb_jkzk]',
  JKZKM_MC string COMMENT '健康状况码_名称',
  XYZJM string COMMENT '信仰宗教码，见[hb_xyzj]',
  XYZJM_MC string COMMENT '信仰宗教码_名称',
  XXM string COMMENT '血型码,见[hb_xx]',
  XXM_MC string COMMENT '血型码_名称',
  ZP string COMMENT '照片',
  SFZJYXQ string COMMENT '身份证件有效期',
  XQH string COMMENT '校区号,见[dim_xq]',
  XQMC string COMMENT '校区名称',
  ZGXLM string COMMENT '最高学历码,见[hb_xl]',
  ZGXLM_MC string COMMENT '最高学历码_名称',
  WHCDM string COMMENT '文化程度码 指本人实际具有的文化水平,见[hb_xl]',
  WHCDM_MC string COMMENT '文化程度_名称',
  CJGZNY string COMMENT '参加工作年月JY/T 1002 JCTB010202',
  LXRQ string COMMENT '来校日期,来校工作的实际报到日期，以人事部门记载为准',
  QXRQ string COMMENT 'JY/T 1002 起薪日期,人事部门正式开始计算薪水的日期',
  CJNY string COMMENT 'JY/T 1002 从教年月,指本人开始从事教育工作的年月',
  BZLBM string COMMENT 'BZLB 编制类别代码，见[hb_bzlb]',
  BZLBM_MC string COMMENT '编制类别名称',
  JZGLBM string COMMENT 'JZGLB教职工类别代码,见[hb_jzglb]',
  JZGLBM_MC string COMMENT '教职工类别',
  RKZKM string COMMENT '任课状况代码,见[hb_rkzk]',
  RKZKM_MC string COMMENT '任课状况代',
  DABH string COMMENT '档案编号',
  DAWB string COMMENT '档案文本',
  DQZTM string COMMENT '当前状态码 JY/T 1001 JZGDQZT教职工当前状态代码 两位代码的第一位 0 表示不在职，1 表示在职',
  TC string COMMENT '特长',
  XKLBM string COMMENT '学科类别码,学位授予和人才培养学科目录,取其前2位,见[hb_xkml]',
  XKLBM_MC string COMMENT '学科类别名称',
  YJXKM string COMMENT '一级学科码,学位授予和人才培养学科目录,取其前4 位代码,见[hb_xklb]',
  YJXKM_MC string COMMENT '一级学科名称',
  EJXKM string COMMENT '二级学科码,学位授予和人才培养学科目录,见[hb_xklb]',
  EJXKM_MC string COMMENT '二级学科名称',
  YJFX string COMMENT '研究方向,从事研究方向的名称',
  ZC string COMMENT '职称'
) COMMENT '[教师信息表]教职工信息扩展表'
PARTITIONED BY ( 
  dt string)
row format delimited
fields terminated by '\t'
STORED AS orc 
TBLPROPERTIES('orc.compress'='SNAPPY');