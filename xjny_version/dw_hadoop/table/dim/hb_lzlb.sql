--  DESCRIPTION: 论著类别代码
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
DROP TABLE IF EXISTS hb_lzlb;
CREATE EXTERNAL TABLE hb_lzlb (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
)  COMMENT '[LZLB 论著类别代码]规定了学术论文、著作等学术成果的类别。第一位表示大类，第二位表示小类。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
