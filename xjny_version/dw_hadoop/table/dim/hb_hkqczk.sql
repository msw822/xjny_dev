--  DESCRIPTION: 户口迁出状况代码
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
DROP TABLE IF EXISTS hb_hkqczk;
CREATE EXTERNAL TABLE hb_hkqczk (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[户口迁出状况代码]高等学校学生毕业办理户口迁出时，领取户口转移证明的状态'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
