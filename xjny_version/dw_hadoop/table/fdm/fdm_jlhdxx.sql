--  DESCRIPTION: 奖励获得信息表
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
drop table if exists fdm.fdm_jlhdxx;
CREATE EXTERNAL TABLE fdm.fdm_jlhdxx(
  XH string comment '学号',
  SFZJH string comment '身份证件号',
  JLMC string comment '奖励名称',
  JLJBM string comment '奖励级别码',
  JLDJM string comment '奖励等级码',
  HJLBM string comment '学生获奖类别代码',
  JLYY string comment '奖励原因',
  JLJE double comment '奖励金额',
  JLWH string comment '奖励文号',
  JLXND string comment '奖励学年度',
  BJDW string comment '颁奖单位',
  JLLXM string comment '奖励类型代码',
  JLFSM string comment '奖励方式码',
  JLNY string comment '奖励年月',
  HJZRS string comment '获奖总人数',
  BRPM string comment '本人排名'
) comment '[奖励获得信息表]关于奖励的类型、原因、时间等信息'
PARTITIONED BY ( 
  dt string)
row format delimited
fields terminated by '\t'
STORED AS orc 
TBLPROPERTIES('orc.compress'='SNAPPY');



