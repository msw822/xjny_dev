--  DESCRIPTION: 学生体质达标代码
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
DROP TABLE IF EXISTS hb_xstzdb;
CREATE EXTERNAL TABLE hb_xstzdb (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
)  COMMENT '[学生体质达标代码]基础教育学生参加“国家学生体质健康标准达标测试”结果'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
