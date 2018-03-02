--  DESCRIPTION: 注册信息表
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
DROP TABLE IF EXISTS FDM.FDM_XS_ZCXX;
CREATE EXTERNAL TABLE
IF NOT EXISTS FDM.FDM_XS_ZCXX (
  XH string COMMENT '学号',
  ZCZKM string 	COMMENT '见注册状况码表[hb_zczk]',
  ZCRQ	string COMMENT '注册日期,格式YYYYMMDD',
  BDRQ	string COMMENT '报到日期,格式YYYYMMDD',
  WZCYY	string COMMENT '未注册原因',
  WZCBDQX	string COMMENT '未注册/报到去向',
  SFQJ	string COMMENT '是否请假,0否,1是',
  XN	string COMMENT '学年(度),格式：YYYY-YYYY,如:2001-2002',
  XQM	tinyint COMMENT'学期码,见学期码表[hb_xq]'
) COMMENT '[注册信息表]关于学生每个学期注册的信息'
PARTITIONED BY ( 
  dt string)
row format delimited
fields terminated by '\t'
stored as orc
TBLPROPERTIES('orc.compres'='SNAPPY');

