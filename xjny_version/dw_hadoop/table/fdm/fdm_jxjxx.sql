--  DESCRIPTION: 奖学金信息表
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
drop table if exists fdm.fdm_jxjxx;
CREATE EXTERNAL TABLE fdm.fdm_jxjxx(
  XH string comment '学号',
  XN string comment '学年(度)',
  XQM double comment '学期码',
  JXJMC string comment '奖学金名称',
  JXJDJ string comment '奖学金等级',
  JXJLXM string comment '奖学金类型码',
  JXJE string comment '奖学金额',
  HJNY string comment '获奖年月',
  FFRQ string comment '发放日期',
  ZRDWGR string comment '资助单位/个人',
  ZJLYM string comment '资金来源码'
) comment '[奖学金信息表]学生获得奖学金的相关信息'
PARTITIONED BY ( 
  dt string)
row format delimited
fields terminated by '\t'
STORED AS  orc 
TBLPROPERTIES('orc.compress'='SNAPPY');
