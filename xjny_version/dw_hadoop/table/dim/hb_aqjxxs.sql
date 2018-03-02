--  DESCRIPTION: 安全教学形式代码
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
DROP TABLE IF EXISTS hb_aqjxxs;
CREATE EXTERNAL TABLE hb_aqjxxs (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[安全教学形式代码]规定了安全教育的教授方式类别'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
