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
DROP TABLE IF EXISTS FDM.fdm_ky_xmjf;
CREATE EXTERNAL TABLE IF NOT EXISTS FDM.fdm_ky_xmjf (
  JHJFZE BIGINT COMMENT '计划经费总额',
  XMJFLYM string COMMENT '项目经费来源码,JY/T 1001XMJFLY 项目经费来源代码[hb_xmjfly]',
  BRRQ string COMMENT '拨入日期JY/T 1002 JCTB010203',
  BKS BIGINT COMMENT '拨款数',
  ZCRQ string COMMENT '支出日期',
  BFXZDWJF BIGINT COMMENT '拨付协作单位经费',
  XMPZBH string COMMENT '项目凭证编号,GXCW020201',
  JBRXM string COMMENT '经办人姓名',
  XMBH string COMMENT '项目编号',
  BKDW string COMMENT '拨款单位',
  BZ string  COMMENT '备注'
) COMMENT '[项目经费信息表]'
PARTITIONED BY (dt string)
row format delimited
fields terminated by '\t'
stored as orc
TBLPROPERTIES('orc.compres'='SNAPPY');

