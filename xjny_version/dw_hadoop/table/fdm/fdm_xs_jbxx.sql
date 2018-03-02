--  DESCRIPTION: 学生基本信息表
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
DROP TABLE IF EXISTS FDM.FDM_XS_JBXX;
CREATE EXTERNAL TABLE
IF NOT EXISTS FDM.FDM_XS_JBXX (
	XH string COMMENT '学号',
	XM string COMMENT '姓名',
	YWXM string COMMENT '英文姓名',
	XMPY string COMMENT '姓名拼音',
	CYM string COMMENT '曾用名',
	XBM string COMMENT '性别码 见表[hb_xb]',
	CSRQ string COMMENT '出生日期,格式YYYY-MM-DD',
	CSDM string COMMENT '出生地码 见表[hb_xqzh]',
	JGM string COMMENT '籍贯码,见[hb_xqzh]',
	MZM string COMMENT '民族码,中国各民族名称的罗马字母拼写法和代码,见[hb_mz]',
	GJDQM string COMMENT '国籍/地区码 见表hb_gjdq',
	SFZJLXM string COMMENT '身份证类型码见身份证件类型代码,见表[hb_sfzjlx]',
	SFZJH string COMMENT '身份证件号',
	HYZKM string COMMENT '婚姻状况码婚姻状况代码,见[hb_hyzk]',
	GATQWM string COMMENT '港澳台侨外码,见港澳台侨外代码,见表[hb_gatqw]',
	ZZMMM string COMMENT '政治面貌码见政治面貌代码,见表[hb_zzmm]',
	JKZKM string COMMENT '健康状况码见健康状况,见表[hb_jkzk]',
	XYZJM string COMMENT '宗教信仰码 见宗教信仰码,见表[hb_xyzj]',
	XXM string COMMENT '血型码,见血型码,见表[hb_xx]',
	ZP string COMMENT '照片,存的是照片url',
	SFZJYXQ string COMMENT '身份证有效期,格式YYYYMMDD-YYYYMMDD',
	SFDSZN  string COMMENT ' 是否独生子女,1:是,2:否,9:未知',
	SFZX string COMMENT '是否在校,0:不在校,1：在校',
	CREATED_TIME string COMMENT '创建时间',
	MODIFIED_TIME string COMMENT '修改时间'
) COMMENT '[学生基本信息表]学生主题基础表,全量更新'
PARTITIONED BY ( 
  dt string)
row format delimited
fields terminated by '\t'
stored as orc
TBLPROPERTIES('orc.compres'='SNAPPY');

