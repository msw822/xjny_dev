--  DESCRIPTION: 施工单位资质等级代码
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
DROP TABLE IF EXISTS hb_sgdwzzdj;
CREATE EXTERNAL TABLE hb_sgdwzzdj (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
)  COMMENT '[施工单位资质等级代码]规定施工单位所具有的工程建设资质等级分类。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
