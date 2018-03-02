--  DESCRIPTION: 图书信息表
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
DROP TABLE IF EXISTS FDM.fdm_ts_tsxx;
CREATE EXTERNAL TABLE
IF NOT EXISTS FDM.fdm_ts_tsxx (
	TSBH BIGINT COMMENT '图书编号，包括图书、磁带、光盘等学校自编',
	TSTXM string COMMENT '图书条形码',
	ZBT string COMMENT '正标题,填写中文或英文',
	BLBT string COMMENT '并列标题',
	FBT string COMMENT '副标题',
	JSGJZ string COMMENT '检索关键字',
	TSCBH string COMMENT '图书相应的ISBN 等标准出版号',
	DYZZ string COMMENT '第一作者名称',
	QTZZ string COMMENT '其他作者',
	JG float COMMENT '单价,外币按汇价折算成人民币,取两位小数,单位：元',
	WXLXM string COMMENT '文献类型码,见[hb_wxlx]',
	ZDM string COMMENT '装订码,见[hb_kwzd]',
	FLH string COMMENT '分类号',
	ZGYZM string COMMENT '中国语种码GB/T 4881，见[hb_zgyz]',
	YZM string COMMENT '语种码GB/T 4880.1，见[hb_yz]',
	KB string COMMENT '开本',
	YS TINYINT COMMENT '页数',
	BC string COMMENT '版次',
	TSFJMC string COMMENT '图书附件名称',
	CSMC string COMMENT '指系列丛书的名称',
	CSBZ string COMMENT '丛书编者',
	CBS string COMMENT '出版社名称，多个出版社可并列',
	CBSJBM string COMMENT 'JY/T 1001CBSJB,出版社级别码，见[hb_cbsjb]，多个出版社以第一个出版社为准',
	CBD string COMMENT '出版地',
	CBRQ string COMMENT '出版日期YYYYMMDD',
	FXDW string COMMENT '发行单位',
	BZ string COMMENT '备注,与图书相关的其他情况说明',
	TSZTM string COMMENT 'TSQKZT 图书期刊状态代码，见[hb_tsqkzt]'
) COMMENT '[图书信息表]图书的基本属性'
PARTITIONED BY (dt string)
row format delimited
fields terminated by '\t'
stored as orc
TBLPROPERTIES('orc.compres'='SNAPPY');

