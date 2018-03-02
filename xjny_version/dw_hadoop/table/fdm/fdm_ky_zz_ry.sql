--  DESCRIPTION: 科研-著作人员
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
-- 
DROP TABLE IF EXISTS FDM.fdm_ky_zz_ry;
CREATE EXTERNAL TABLE IF NOT EXISTS FDM.fdm_ky_zz_ry (
  RYH string COMMENT '人员号,参与项目人员号（教工填写工号，学生填写学号）',
  XM string COMMENT '姓名',
  XB string COMMENT '性别',
  ZC string COMMENT '职称',
  DWH string COMMENT '单位号,见[dim_dw]',
  DWMC string COMMENT '单位名称',
  GZL double COMMENT '工作量,个人参与项目的工作量比例，单位：％',
  MNGZYS tinyint COMMENT '每年工作月数,按折合的全时人月数计算，参照国家自然科学基金的工作量计算方式',
  JSM string COMMENT '角色码,见hb_js',
  RYLXM string COMMENT '人员类型码,自编',
  RYLXMC string COMMENT '人员类型:学生,校内老师,校外老师',
  SMSX string COMMENT '署名顺序',
  XLM string COMMENT '学历码,[hb_xl]',
  KYBH string COMMENT '专利成果/项目编号',
  CREATED_TIME string  COMMENT '创建时间',
  MODIFIED_time string COMMENT '修改时间或处理时间'
) COMMENT '[科研-著作人员]人员基础表,全量更新'
PARTITIONED BY (dt string)
row format delimited
fields terminated by '\t'
stored as orc

TBLPROPERTIES('orc.compres'='SNAPPY');

