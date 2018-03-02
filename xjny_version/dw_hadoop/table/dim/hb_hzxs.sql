--  DESCRIPTION: HZXS 合作形式代码
--
--     OPTIONS: ---
-- REQUIREMENTS: ---
--        BUGS: ---
--        NOTES: ---
--       AUTHOR: song.shengjie@h3c.com
--     COMPANY: h3c.bigdata
--      VERSION: 1.0
--     CREATED: 2017/08/18
--    REVIEWER:
--    REVISION: ---
--
use dim;
DROP TABLE IF EXISTS hb_hzxs;
CREATE EXTERNAL TABLE hb_hzxs (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
)  COMMENT '[HZXS 合作形式代码]本代码规定了高等学校科技项目合作方式的分类'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
