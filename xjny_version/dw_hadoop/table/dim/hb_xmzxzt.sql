--  DESCRIPTION: 项目执行状态代码
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
DROP TABLE IF EXISTS hb_xmzxzt;
CREATE EXTERNAL TABLE hb_xmzxzt (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
)  COMMENT '[项目执行状态代码]规定了科学研究项目执行状态的分类,用一位数字表示'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
