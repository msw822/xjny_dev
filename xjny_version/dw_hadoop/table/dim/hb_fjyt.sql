--  DESCRIPTION: 房间用途代码
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
DROP TABLE IF EXISTS hb_fjyt;
CREATE EXTERNAL TABLE hb_fjyt (
  DM string COMMENT '代码',
  MC string COMMENT '名称',
  SYXX string COMMENT '适用学校'
) COMMENT '[房间用途代码]规定中小学校、中等职业学校、高等学校和幼儿园对房间（校舍）用途的分类。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
