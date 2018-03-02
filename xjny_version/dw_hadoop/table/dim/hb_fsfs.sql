--  DESCRIPTION: 发送方式代码
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
DROP TABLE IF EXISTS hb_fsfs;
CREATE EXTERNAL TABLE hb_fsfs (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[发送方式代码]规定公文向外发送的方式类别。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
