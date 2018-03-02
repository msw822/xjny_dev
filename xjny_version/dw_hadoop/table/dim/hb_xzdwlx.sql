--  DESCRIPTION: 协作单位类型代码
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
DROP TABLE IF EXISTS hb_xzdwlx;
CREATE EXTERNAL TABLE hb_xzdwlx (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[协作单位类型代码]参与项目研究的协作单位分类。适用于中小学校、中等职业学校和高等学校'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
