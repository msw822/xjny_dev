--  DESCRIPTION: 阅办类别代码
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
DROP TABLE IF EXISTS hb_yblb;
CREATE EXTERNAL TABLE hb_yblb (
  DM string COMMENT '代码',
  MC string COMMENT '名称'
) COMMENT '[阅办类别代码]规定公文办理流程的节点编码。'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
