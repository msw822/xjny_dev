--  DESCRIPTION: 各科研-汇总表
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

DROP TABLE IF EXISTS gdm.gdm_ky_detail_sum;
CREATE EXTERNAL TABLE gdm.gdm_ky_detail_sum(
  DWH string COMMENT '单位号',
  DWMC string COMMENT '单位名称',
  KY_BH string COMMENT '各自编号',
  KY_MC string COMMENT '项目/专利/著作/成果 名称',
  LY_LX string COMMENT '(各科研自己的)类型',
  KY_LB string COMMENT '科研类型:项目、专利、著作',
  HJMC string COMMENT '获奖名称',
  KY_DJ string COMMENT '级别',
  KY_ZZ string COMMENT '作者',
  KY_RQ string COMMENT '(各科研自己的)日期'
) COMMENT '各科研-汇总表'
PARTITIONED BY ( 
  dt string)
row format delimited
fields terminated by '\t'
STORED AS orc 
TBLPROPERTIES('orc.compress'='SNAPPY');
