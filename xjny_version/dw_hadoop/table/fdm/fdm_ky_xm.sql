--  DESCRIPTION: 科研项目信息
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
DROP TABLE IF EXISTS FDM.fdm_ky_xm ;
CREATE EXTERNAL TABLE FDM.fdm_ky_xm (
  XMBH string COMMENT '项目编号',
  DWH string COMMENT '单位号',
  XMMC string COMMENT '项目名称',
  ZXBH string COMMENT '专项编号',
  KSRQ string COMMENT '开始日期',
  JXRQ string COMMENT '结项日期',
  XMFZRH string COMMENT '项目负责人号,JY/T 1002 JCTB020120',
   XMWTDWM string COMMENT '项目委托单位码',
  XMWTDWMC string COMMENT '项目委托单位,单位名称 JY/T 1002 JCTB010302',
  XMLYM string COMMENT '项目来源码,见[hb_xmly]',
  MJM string COMMENT '密级码,见[hb_bmdj]',
  SHJJXYM string COMMENT '社会经济效益码,JY/T 1001见[hb_shjjxy]',
  XKLYM string COMMENT '学科领域码,GB/T 13745,取其一、二级分类码,见[hb_xklb]',
  GJDQM string COMMENT '合作国家/地区码,JY/T 1002,JCTB020110,见[hb_gjdq]',
  JHWCQKM string COMMENT '计划完成情况码,JY/T 1001 JHWCQK 计划完成情况代码,见[hb_jhwcqk]',
  HZXSM string COMMENT '合作形式码,JY/T 1001见[hb_hzxs]',
  SSJSLY string COMMENT '所属技术领域',
  XMPZH string COMMENT '项目批准号',
  XMLBM string COMMENT '项目类别码,见[eud_hb_xmlb]',
  XMJBM string COMMENT '项目级别码,学校自编,GB/T 14946.1－2009 附录A.29',
  HDLXM string COMMENT '活动类型码,JY/T 1001 [hb_hdlx]',
  XMZXZTM string COMMENT '项目执行状态码JY/T 1001 XMZXZT [hb_xmzxzt]',
  XMJTXS string COMMENT '项目结题形式',
  SBRQ string COMMENT '申报日期',
  LXRQ string COMMENT '立项日期',
  ZGBM string COMMENT '主管部门',
  XKMLKJM string COMMENT '学科门类(科技)码,JY/T 1001 XKMLKJ 学科门类（科技）代码,见[hb_xkml]',
  SSHYM string COMMENT '所属行业码,GB/T 4754',
  DWJSM string COMMENT '单位角色码,见[hb_js]',
  SBXMH string COMMENT '申报项目号',
  YQYJCGJXS string COMMENT '预期研究成果及形式',
  XMZY string COMMENT '项目摘要',
  XDWH string COMMENT '下达文号',
  KTRQ string COMMENT '开题日期',
  SHJJMB string COMMENT '社会经济目标',
  ZTC string COMMENT '主题词',
  SSZKT string COMMENT '所属主课题',
  XMLYDW string COMMENT '项目来源单位',
  JBM string COMMENT '项目性质/项目级别,见[hb_jb]表'
) COMMENT '[科研项目信息]科研主题信息之一'
PARTITIONED BY (dt string)
row format delimited
fields terminated by '\t'
stored as orc
TBLPROPERTIES('orc.compres'='SNAPPY');

