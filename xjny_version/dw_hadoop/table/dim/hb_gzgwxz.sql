--  DESCRIPTION: 工作岗位性质代码
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
DROP TABLE IF EXISTS hb_gzgwxz;
CREATE EXTERNAL TABLE hb_gzgwxz (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[工作岗位性质代码]高等学校毕业生在就业单位中的工作岗位性质分类'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
