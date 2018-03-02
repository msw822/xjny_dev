--  DESCRIPTION: 设计单位资质代码
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
DROP TABLE IF EXISTS hb_sjdwzz;
CREATE EXTERNAL TABLE hb_sjdwzz (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[设计单位资质代码]规定项目设计承担单位所具有的设计资质等级的分类。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
