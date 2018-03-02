--  DESCRIPTION: 学籍异动信息表
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
DROP TABLE IF EXISTS FDM.FDM_XS_XJYDXX;
CREATE EXTERNAL TABLE
IF NOT EXISTS FDM.FDM_XS_XJYDXX (
	YDLBM string COMMENT '学籍异动类别代码,见表[hb_xjydlb]',
	YDRQ string COMMENT '异动日期,格式YYYYMMDD',
	YDYYM string COMMENT '异动原因码,见表[hb_xjydyy]',
	SPRQ string COMMENT '审批日期,格式YYYYMMDD',
	SPWH string COMMENT '审批文号',
	YDLYXXM string COMMENT '异动来源学校码',
	YDQXXXM string COMMENT '异动去向学校码',
	YDSM string COMMENT '异动说明',
	YSSYXM string COMMENT '原院系码,见[dim_dw]',
	YZYM string COMMENT '原专业码,见[dim_zz]',
	YBH string COMMENT '原班号,学校自编,见[dim_bj]',
	YNJ string COMMENT '原年级',
    YXZ float COMMENT '原学制,如2.5',
	XSSYXM string COMMENT '现院系所码,即单位号,自行编码',
	XZYM string COMMENT '现专业码,见[dim_zz]',
	XBH string COMMENT '现班号,见[dim_bj]',
	XNJ string COMMENT '现年级',
	XXZ float COMMENT '现学制,如2.5',
	XH string COMMENT '学号',
	SFZJH string COMMENT '身份证件号',
	SFZXXJ string COMMENT '是否注销年级',
	YZYFXDM	string COMMENT'原专业方向代码'
) COMMENT '[学籍异动信息表]本数据子类规定了学籍异动的相关数据项.'
PARTITIONED BY ( 
  dt string)
row format delimited
fields terminated by '\t'
stored as orc
TBLPROPERTIES('orc.compres'='SNAPPY');

