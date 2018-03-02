--  DESCRIPTION: 会议举办形式代码
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
DROP TABLE IF EXISTS hb_hyjbxs;
CREATE EXTERNAL TABLE hb_hyjbxs (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[会议举办形式代码]学术会议的举办形式分类。适用于中小学校、中等职业学校和高等学校'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
