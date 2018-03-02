--  DESCRIPTION: 学校（教育机构）举办者代码
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
DROP TABLE IF EXISTS hb_xxjyjgjbz;

CREATE EXTERNAL TABLE hb_xxjyjgjbz (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[学校（教育机构）举办者代码]。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
