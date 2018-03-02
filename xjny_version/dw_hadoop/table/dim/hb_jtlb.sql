--  DESCRIPTION: 家庭类别代码
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
DROP TABLE IF EXISTS hb_jtlb;
CREATE EXTERNAL TABLE hb_jtlb (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[家庭类别代码]学生家庭类别的分类，适用于了解学生家庭经济困难原因'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
