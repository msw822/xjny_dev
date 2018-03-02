--  DESCRIPTION: 编制异动代码
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
DROP TABLE IF EXISTS hb_bzyd;
CREATE EXTERNAL TABLE hb_bzyd (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[编制异动代码]教学类岗位与非教学类岗位编制变动的分类'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
