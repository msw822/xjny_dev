--  DESCRIPTION: 联系人信息表
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
DROP TABLE IF EXISTS FDM.FDM_XS_LXRXX;
CREATE EXTERNAL TABLE
IF NOT EXISTS FDM.FDM_XS_LXRXX (
  XH string COMMENT '学号',
  JTGXM	  string COMMENT'关系码,见[hb_jtgx]',
  LXRXM string COMMENT '联系人姓名',
  YZBM  string COMMENT '邮政编码',
  TXDZ  string COMMENT	'通讯地址,指包括省(自治区、直辖市)/地（市、州）/县（区、旗）/乡（镇）/街（村）/门牌号的详细地址',
  DH    string COMMENT '电话',
  YDDH  string COMMENT	'移动电话',
  CZDH  string COMMENT '传真电话',
  DZXX  string COMMENT	'电子信箱,电子邮件地址', 
  WLDZ  string COMMENT '网络地址,如主页、博客、微博网址',
  JSTXH string COMMENT '即时通讯号,如MSN/QQ 等号码'
) COMMENT '[联系人信息表]关系关系基础表,全量更新'
PARTITIONED BY ( dt string)
row format delimited
fields terminated by '\t'
stored as orc
TBLPROPERTIES('orc.compres'='SNAPPY');

