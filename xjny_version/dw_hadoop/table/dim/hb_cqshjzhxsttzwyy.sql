--  DESCRIPTION: 辞去社会兼职或学术团体职务原因代码
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
DROP TABLE IF EXISTS hb_cqshjzhxsttzwyy;
CREATE EXTERNAL TABLE hb_cqshjzhxsttzwyy (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[辞去社会兼职或学术团体职务原因代码]代替2002年《教育管理信息化标准 第1部分：学校管理信息标准》'
row format delimited
fields terminated by '\t'
STORED AS textfile;
