--  DESCRIPTION: 读者信息表
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
DROP TABLE IF EXISTS FDM.fdm_ts_dzxx;
CREATE EXTERNAL TABLE
IF NOT EXISTS FDM.fdm_ts_dzxx (
  JSZH string COMMENT '借书证号',
  DZTM	string COMMENT '读者条码',
  XH string COMMENT '学号',
  SFZJH string COMMENT '身份证件号',
  YJ bigint COMMENT '押金',
  KWJ TINYINT COMMENT '可外借数量',
  YWJ	TINYINT COMMENT '已外借数量',
  FZRQ string COMMENT '发证日期',
  SXRQ string COMMENT '失效日期',
  GSZX string COMMENT '挂失注销',
  GSRQ string COMMENT '挂失日期',
  QFK	bigint COMMENT '欠罚款,单位：分',
  YE	bigint COMMENT '余额',
  SCDGSJ string COMMENT '上次到馆时间 YYYYMMDD HH:mm:ss',
  LJWJCS tinyint COMMENT '累计外借册数',
  LJCQCS tinyint COMMENT '累计超期册数',
  LJJFK	 tinyint COMMENT '累计交罚款',
  LJPK	bigint COMMENT '累计赔款',
  LJDGCS	tinyint COMMENT'累计到馆次数'
) COMMENT '[读者信息表]学生借阅情况的基础表'
PARTITIONED BY (dt string)
row format delimited
fields terminated by '\t'
stored as orc
TBLPROPERTIES('orc.compres'='SNAPPY');

