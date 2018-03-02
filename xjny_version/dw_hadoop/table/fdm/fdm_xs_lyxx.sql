--  DESCRIPTION: 学生来源信息表
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
DROP TABLE IF EXISTS FDM.FDM_XS_LYXX;
CREATE EXTERNAL TABLE
IF NOT EXISTS FDM.FDM_XS_LYXX (
  XH string COMMENT '学号',
  YXXMC string  COMMENT '原学校名称',
  YXH string  COMMENT '原学号',
  RXFSM string COMMENT '见入学方式代码表如01,10[hb_rxfs]',
  LYDQM string  COMMENT '学生来源地区码,见中华人民共和国行政区划代码表[hb_xzqh]',
  XSLYM string  COMMENT '学生来源码,见学生来源代码表 如001[hb_xsly]',
  JDFSM string  COMMENT '就读方式码[hb_jdfs]',
  LYGBDQM string  COMMENT '来源国别/地区码[hb_gjdq]',
  SYDM string  COMMENT '生源地码[hb_xzqh]',
  DXWPDW string  COMMENT '定向/委培单位',
  RXQXLM string  COMMENT '入学前最后学历码,见学历代码[hb_xl]',
  RXQXWM string  COMMENT '入学前最后学位码,见中华人民共和国学位代码[hb_xw]'
) COMMENT '[学生来源信息表]记录学生的生源地等信息'
PARTITIONED BY ( dt string)
row format delimited
fields terminated by '\t'
stored as orc
TBLPROPERTIES('orc.compres'='SNAPPY');

