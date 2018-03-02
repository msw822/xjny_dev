--  DESCRIPTION: 实验者类别代码
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
DROP TABLE IF EXISTS hb_syzlb;
CREATE EXTERNAL TABLE hb_syzlb (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[实验者类别代码]规定实验者的分类，适用于中小学校、中等职业学校和高等学校。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
