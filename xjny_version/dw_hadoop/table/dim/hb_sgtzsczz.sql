--  DESCRIPTION: 施工图纸审查资质代码
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
DROP TABLE IF EXISTS hb_sgtzsczz;
CREATE EXTERNAL TABLE hb_sgtzsczz (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[施工图纸审查资质代码]规定施工图纸审查承担单位所具有的相关资质等级的分类。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
