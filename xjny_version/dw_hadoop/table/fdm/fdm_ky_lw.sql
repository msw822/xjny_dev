--  DESCRIPTION: 论文信息
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
DROP TABLE IF EXISTS FDM.fdm_ky_lw ;
CREATE EXTERNAL TABLE FDM.fdm_ky_lw(
  LWBH string COMMENT '论文编号',
  LWZWMC string COMMENT '论文中文名',
  LWYWMC string COMMENT '论文英文名',
  DWH string  COMMENT '单位号',
  LWLXM string  COMMENT '论文类型码,见[hb_hdlx]',
  LZLBM string  COMMENT '论著类别码,见[hb_lzlb]',
  XKLYM string COMMENT '学科领域码,见[hb_xklb]',
  XKMLKJM string COMMENT '学科门类(科技)码,见[hb_xkml]',
  XMLYM string COMMENT '项目来源码,见[hb_xmly]',
  ZGYZM string COMMENT '中国语种码,见[hb_zgyz]',
  YZM string COMMENT '语种码,见[hb_yz]',
  SSXMBH string  COMMENT '所属项目编号',
  SSJSLY string  COMMENT '所属技术领域',
  LZSLQKM string  COMMENT '论著收录情况码,学校自编',
  QTSLQK string  COMMENT '其他收录情况,自述',
  SLSJ string COMMENT '收录时间'
) COMMENT '[论文信息]科研主题模型之一'
PARTITIONED BY (dt string)
row format delimited
fields terminated by '\t'
stored as orc
TBLPROPERTIES('orc.compres'='SNAPPY');

