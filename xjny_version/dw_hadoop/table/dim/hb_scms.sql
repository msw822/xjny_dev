--  DESCRIPTION: 色彩模式代码
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
DROP TABLE IF EXISTS hb_scms;
CREATE EXTERNAL TABLE hb_scms (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[色彩模式代码]规定多媒体档案文件的色彩模式分类，适用于各级各类学校和教育行政部门。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
