--  DESCRIPTION: 学籍信息表
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
DROP TABLE IF EXISTS FDM.FDM_XS_XJXX;
CREATE EXTERNAL TABLE 
IF NOT EXISTS FDM.FDM_XS_XJXX (
  XH string COMMENT '学号',
  RXNY string COMMENT '入学年月,YYYYMM格式',
  XSLBM string COMMENT '见学生类别码表[hb_xslb]',
  XZ double COMMENT '学制,如2.5',
  ZYM string COMMENT '专业码,见[hb_bzkzy]',
  SZBH string COMMENT '所在班号,见',
  SZNJ string COMMENT '所在年级',
  XSDQZTM string COMMENT '学生当前(学籍)状态,见学生当前状态代码表[hb_xsdqzt]',
  SSXYM string COMMENT '所属学院所系码，见[hb_SSXYM]',
  XKMLM string COMMENT '学科门类码，见[hb_xkml]',
  PYFSM string COMMENT '培养方式码，见[hb_pyfs]',
  YJFX string COMMENT '研究方向',
  DSH string COMMENT '导师号',
  HDXLFSM string COMMENT '获得学历方式码，见[hb_hdxlfs]',
  SFXFZ string COMMENT '是否学分制',
  PYCCM string COMMENT '培养层次码，见[hb_pycc]',
  LDFSM string COMMENT '连读方式码，学校自编',
  CREATED_TIME string COMMENT '创建时间',
  MODIFIED_TIME string COMMENT '修改时间'
) COMMENT '[学籍信息表]学生维度信息之一'
PARTITIONED BY (dt string)
row format delimited
fields terminated by '\t'
stored as orc
TBLPROPERTIES('orc.compres'='SNAPPY');

