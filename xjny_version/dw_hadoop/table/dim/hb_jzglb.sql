--  DESCRIPTION: 教职工类别
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
DROP TABLE IF EXISTS hb_jzglb;
CREATE EXTERNAL TABLE hb_jzglb (
  DM string COMMENT '代码',
  MC string COMMENT '名称',
  SM string COMMENT '说明'
) COMMENT '[教职工类别]规定了高等学校、中等职业学校和中小学校的教职工类别,第一位表示大类，第二位表示小类。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
