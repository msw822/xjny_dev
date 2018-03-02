--  DESCRIPTION: 议题状态代码
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
DROP TABLE IF EXISTS hb_ytzt;
CREATE EXTERNAL TABLE hb_ytzt (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[议题状态代码]规定高等学校会议管理中的议题状态分类。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
