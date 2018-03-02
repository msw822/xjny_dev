--  DESCRIPTION: 培训证书类型代码
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
DROP TABLE IF EXISTS hb_pxzslx;
CREATE EXTERNAL TABLE hb_pxzslx (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[培训证书类型代码]规定教育统计所要求的培训证书类型，适用于适用于中等教育、高等教育阶段。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
