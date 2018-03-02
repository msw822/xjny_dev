--  DESCRIPTION: 教师变动代码
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
DROP TABLE IF EXISTS hb_jsbd;
CREATE EXTERNAL TABLE hb_jsbd (
  DM string COMMENT '代码',
  MC string COMMENT '名称',
  JYTJSYXX string COMMENT '教育统计适用学校'
)  COMMENT '[教师变动代码]教育统计所要求的各级各类学校（机构）专任教师变动情况'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
