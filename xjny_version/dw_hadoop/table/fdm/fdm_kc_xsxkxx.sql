--  DESCRIPTION: 选课信息表
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

DROP TABLE IF EXISTS fdm.fdm_kc_xsxkxx;
CREATE EXTERNAL TABLE IF NOT EXISTS fdm.fdm_kc_xsxkxx(
  KCDM string COMMENT '课程号',
  KXH string COMMENT '课序号',
  XKNJ string COMMENT '选课年级',
  XKXND string COMMENT '选课学年度',
  JSZGH string COMMENT '教师职工号',
  XH string COMMENT '学号',
  XKKH string COMMENT '选课课号',
  XKRSXD string COMMENT '选课人数限定',
  XKXQM string COMMENT '选课学期码',
  SJXKRS int COMMENT '实际选课人数'
 
) COMMENT '[选课信息表]规定了选课的基本数据项。'
PARTITIONED BY ( 
  dt string)
row format delimited
fields terminated by '\t'
STORED AS orc 
TBLPROPERTIES('orc.compress'='SNAPPY');
