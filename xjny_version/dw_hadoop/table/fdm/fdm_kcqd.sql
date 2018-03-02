--  DESCRIPTION: 课程签到表
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
DROP TABLE IF EXISTS fdm.fdm_kcqd;
CREATE EXTERNAL TABLE IF NOT EXISTS fdm.fdm_kcqd (
   QDZH string COMMENT '签到账号',
  QDSJ string COMMENT '签到时间',
  KCH string COMMENT '签到课程号',
  QDKC string COMMENT '签到课程',
  QDSHFW string COMMENT '课程签到时间范围',
  QDJD double COMMENT '签到时用户当前经度',
  QDWD double COMMENT '签到时用户当前纬度',
  WQDJD double COMMENT '未签到时用户当前经度',
  WQDWD double COMMENT '未签到时用户当前纬度',
  QDZT string COMMENT '签到状态:准签：1 请假：2 迟到：3 未签：4 蹭课：5',
  QDSJWYBS string COMMENT '签到手机唯一标识',
  QDFS string COMMENT '签到方式:1.微信 2.APP 3.微信补签 4.APP补签 5.后台补签',
  KJXZCS int COMMENT '在手机上下载课件的次数',
  YHLX string COMMENT '用户类型',
  QYID string COMMENT '区域ID',
  SJC string COMMENT '时间戳'
) COMMENT '[课程签到表]'
PARTITIONED BY ( 
  dt string)
row format delimited
fields terminated by '\t'
STORED AS orc 
TBLPROPERTIES('orc.compress'='SNAPPY');

