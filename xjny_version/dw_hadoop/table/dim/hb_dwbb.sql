--  DESCRIPTION: 单位办别代码
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
DROP TABLE IF EXISTS hb_dwbb;
CREATE EXTERNAL TABLE hb_dwbb (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[单位办别代码]规定高等学校和中等职业学校校内单位的举办类别。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
