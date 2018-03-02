--  DESCRIPTION: 项目类型代码
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
DROP TABLE IF EXISTS hb_xmlx;
CREATE EXTERNAL TABLE hb_xmlx (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
)  COMMENT '[项目类型代码]中小学校和中等职业学校研究项目的类型'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
