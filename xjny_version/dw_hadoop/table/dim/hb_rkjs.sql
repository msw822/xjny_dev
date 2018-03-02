--  DESCRIPTION: 任课角色代码
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
DROP TABLE IF EXISTS hb_rkjs;
CREATE EXTERNAL TABLE hb_rkjs (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[任课角色代码]中小学校、中等职业学校和高等学校中教师任课的角色分类'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
