--  DESCRIPTION: 研究生录取调剂类别代码
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
DROP TABLE IF EXISTS hb_yjslqtjlb

;
CREATE EXTERNAL TABLE hb_yjslqtjlb (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[研究生录取调剂类别代码]高等学校研究生招生调剂录取方式的分类'
row format delimited
fields terminated by '\t'
STORED AS textfile;
