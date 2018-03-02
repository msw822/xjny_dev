--  DESCRIPTION: 服务业发票规格代码
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
DROP TABLE IF EXISTS hb_fwyfpgg;
CREATE EXTERNAL TABLE hb_fwyfpgg (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[服务业发票规格代码]高等学校财务管理使用发票的规格分类'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
