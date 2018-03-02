--  DESCRIPTION: 图书类别码
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
DROP TABLE IF EXISTS hb_tslb;
CREATE EXTERNAL TABLE hb_tslb (
  DM string COMMENT '类别代码',
  MC string COMMENT '类别名称'
) COMMENT '[图书类别码]来自中国图书馆分类法。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
