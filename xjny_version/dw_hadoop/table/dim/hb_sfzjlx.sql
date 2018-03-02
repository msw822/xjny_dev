--  DESCRIPTION: 身份证件类型代码
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
DROP TABLE IF EXISTS hb_sfzjlx;
CREATE EXTERNAL TABLE hb_sfzjlx (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[身份证件类型代码]规定了对师生员工身份证件的类别，采用一位顺序码。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
