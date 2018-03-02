--  DESCRIPTION: 教学成果奖
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
drop table if exists fdm.fdm_jzg_jxcgj;
CREATE EXTERNAL TABLE fdm.fdm_jzg_jxcgj(
  ID string comment '获奖ID',
  HJNY string comment '获奖年月',
  CGMC string comment '成果名称',
  SZDW string comment '所在单位',
  JLDJM string comment '成果发明人',
  PM string comment '排名',
  HJDJ string comment '获奖等级',
  HJLB double comment '获奖类别',
  ZJH string comment '职工号'
) comment '[教学成果奖]获奖相关信息'
PARTITIONED BY ( 
  dt string)
row format delimited
fields terminated by '\t'
STORED AS orc 
TBLPROPERTIES('orc.compress'='SNAPPY');


