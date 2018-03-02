--  DESCRIPTION: 家庭通讯方式信息表
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
DROP TABLE IF EXISTS FDM.FDM_XS_JTTXFSXX;
CREATE EXTERNAL TABLE
IF NOT EXISTS FDM.FDM_XS_JTTXFSXX (
  XH string COMMENT '学号',
  JTZZ string COMMENT'家庭住址,指包括省（自治区、直辖市）/地（市、州）/县（区、旗）/乡（镇）/街（村）/门牌号的详细地址',
  JTYZBM string COMMENT '家庭邮政编码',
  JTDH	string COMMENT '家庭电话',
  JTDZXX string COMMENT '家庭电子信箱',
  XZZ string COMMENT '现住址',
  HKSZD	string COMMENT '户口所在地,见中华人民共和国行政区划代码表[hb_xzqh]',
  HKLBM	int COMMENT '见户口类别码,见表[hb_hkxz]'
) COMMENT '[家庭通讯方式信息表]关于家庭方面的联系信息'
PARTITIONED BY ( 
  dt string)
row format delimited
fields terminated by '\t'
stored as orc
TBLPROPERTIES('orc.compres'='SNAPPY');
