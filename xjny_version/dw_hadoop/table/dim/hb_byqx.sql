--  DESCRIPTION: 毕业去向代码
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
DROP TABLE IF EXISTS hb_byqx;
CREATE EXTERNAL TABLE hb_byqx (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[毕业去向代码]中小学和中等职业学校学生毕业去向'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
