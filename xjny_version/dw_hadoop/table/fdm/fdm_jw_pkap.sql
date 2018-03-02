--  DESCRIPTION: 排课数据表
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
--    REVISION: 2018/02/24 li.zhanlei
DROP TABLE IF EXISTS fdm.fdm_jw_pkap;
CREATE EXTERNAL TABLE IF NOT EXISTS fdm.fdm_jw_pkap(
  JXBH string COMMENT '教学班号,例如2012-2013(学年)-2(学期)-D12D0A27(课程号)-2',
  KCDM string COMMENT '课程代码',                   
  KCKSDWH string COMMENT '课程开设单位号-院系代码',
  XF double COMMENT '学分',
  ZXS double COMMENT '总学时',
  KCSXM string COMMENT '课程属性码，旧名类别',
  KCSXM_MC string COMMENT '课程属性',
  KCXZM string COMMENT '课程性质码',
  KCXZM_MC string COMMENT '课程性质'
)  COMMENT '[排课数据表]排课--为分教学班授课课程的编排'
PARTITIONED BY (xn string,
  xqm string)
row format delimited
fields terminated by '\t'
STORED AS orc 
TBLPROPERTIES('orc.compress'='SNAPPY');
