--  DESCRIPTION: 校学位委员会结论代码
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
DROP TABLE IF EXISTS hb_xxwwyhjl;
CREATE EXTERNAL TABLE hb_xxwwyhjl (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[校学位委员会结论代码]规定高等学校学位委员会对学位评审结论的分类。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
