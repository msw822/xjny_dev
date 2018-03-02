--  DESCRIPTION: 科研-项目宽表
--
--     OPTIONS: ---
-- REQUIREMENTS: ---
--        BUGS: ---
--        NOTES: ---
--       AUTHOR: lizhanlei@h3c.com
--     COMPANY: h3c.bigdata
--      VERSION: 1.0
--     CREATED: 2018/02/28
--    REVIEWER:
--    REVISION:

DROP TABLE IF EXISTS gdm.gdm_ky_xm_da;
CREATE EXTERNAL TABLE IF NOT EXISTS gdm.gdm_ky_xm_da (
  XMBH string COMMENT '项目编号',
  DWH string COMMENT '单位号，见[dim_dw]',
  DWMC string COMMENT '单位名称',
  XMMC string COMMENT '项目名称',
  ZXBH string COMMENT '专项编号',
  KSRQ string COMMENT '开始日期',
  JXRQ string COMMENT '结项日期',
  XMFZRH string COMMENT '项目负责人号,见[fac_ky_xm]',
  XMWTDWM string COMMENT '项目委托单位码',
  XMWTDWMC string COMMENT '项目委托单位,单位名称 JY/T 1002 JCTB010302 JCTB010302',
  XMLYM string COMMENT '项目来源码，见[hb_xmly]',
  XMLYM_MC string COMMENT '项目来源码_名称',
  MJM string COMMENT '密级码，见[hb_bmdj]',
  MJM_MC string COMMENT '密级码_名称',
  SHJJXYM string COMMENT '社会经济效益码 见[hb_shjjxy]',
  SHJJXYM_MC string COMMENT '社会经济效益码_名称',
  XKLYM string COMMENT '学科领域码,GB/T 13745,取其一、二级分类码',
  XKLYM_MC string COMMENT '学科领域码名称',
  GJDQM string COMMENT '合作国家/地区码，见[hb_gjdq]',
  GJDQM_MC string COMMENT '合作国家/地区码_名称',
  JHWCQKM string COMMENT '计JHWCQK 计划完成情况代码，见[hb_shjjxy]',
  JHWCQKM_MC string COMMENT '计划完成情况码_名称',
  HZXSM string COMMENT 'HZXS合作形式代码，见[hb_hzxs]',
  HZXSM_MC string COMMENT '合作形式码名称',
  SSJSLY string COMMENT '所属技术领域',
  XMPZH string COMMENT '项目批准号',
  XMLBM string  COMMENT '项目类别码，见[hb_xmlb]',
  XMLBM_MC string COMMENT '项目类别码名称',
  XMJBM string COMMENT '项目级别码,学校自编,GB/T 14946.1－2009 附录A.29',
  XMJBM_MC string COMMENT '项目级别码名称',
  HDLXM string COMMENT '活动类型码,JY/T 1001 HDLX活动类型代码',
  HDLXM_MC string COMMENT '[hb_hdlx]活动类型码名称',
  XMZXZTM string COMMENT '项目执行状态码JY/T 1001 XMZXZT 项目执行状态代码',
  ZMZXZTM_MC string COMMENT '[hb_xmzxzt]项目执行状态名称',
  XMJTXS string COMMENT '项目结题形式',
  SBRQ string COMMENT '申报日期',
  LXRQ string COMMENT '立项日期',
  ZGBM string COMMENT '主管部门',
  XKMLKJM string COMMENT 'XKMLKJ 学科门类（科技）代码，见[hb_xkml]',
  XKMLKJM_MC string COMMENT '学科门类(科技)码_名称', 
  SSHYM string COMMENT '所属行业码,GB/T 4754',
  SSHYM_MC string COMMENT '所属行业码名称',
  DWJSM string COMMENT '单位角色码，见[hb_js]',
  DWJSM_MC string COMMENT '单位角色码_名称',
  SBXMH string COMMENT '申报项目号',
  YQYJCGJXS string  COMMENT '预期研究成果及形式',
  XMZY string COMMENT '项目摘要',
  XDWH string COMMENT '下达文号',
  KTRQ string COMMENT '开题日期',
  SHJJMB string COMMENT '社会经济目标',
  ZTC string COMMENT '主题词',
  SSZKT string COMMENT '所属主课题',
  XMLYDW string COMMENT '项目来源单位',
  JBM string COMMENT '项目级别码，见[hb_jb]',
  JBM_MC string COMMENT '项目级别码_名称',
  JHJFZE int COMMENT '计划经费总额',
  XMJFLYM string COMMENT 'XMJFLY 项目经费来源代码，见 [hb_xmjfly]',
  XMJFLYM_MC string COMMENT '项目经费来源码_名称',
  BRRQ string COMMENT '拨入日期JY/T 1002 JCTB010203',
  BKS int COMMENT '拨款数',
  ZCRQ string COMMENT '支出日期',
  BFXZDWJF int COMMENT '拨付协作单位经费',
  BKDW string COMMENT '拨款单位'
) COMMENT '[科研-项目宽表]来自父表[fdm_ky_xm]'
PARTITIONED BY ( 
  dt string)
row format delimited
fields terminated by '\t'
STORED AS orc 
TBLPROPERTIES('orc.compress'='SNAPPY');