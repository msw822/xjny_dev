--  DESCRIPTION: 本科生门禁记录[图书馆，宿舍等有门禁的]
--
--     OPTIONS: ---
-- REQUIREMENTS: ---
--        BUGS: ---
--        NOTES: (2018/02/11 li.zhanlei@h3c.com 修改表名、增加字段)
--       AUTHOR: song.shengjie@h3c.com
--     COMPANY: h3c.bigdata
--      VERSION: 1.0
--     CREATED: 2017/08/11
--    REVIEWER:
--    REVISION:
DROP TABLE IF EXISTS fdm.fdm_xs_mj_log;
CREATE EXTERNAL TABLE fdm.fdm_xs_mj_log (
  XH string COMMENT '学号',
  XM string COMMENT '姓名',
  LB string COMMENT '类别【新本科生】',
  BJ string COMMENT '班级',
  SKSJ string COMMENT '刷卡时间',
  gateno string COMMENT '门号【几号门】',
  act string COMMENT '进出类型枚举：1出；2入；3潜入；4潜出；5无出；6反入，7无入，8潜入的状态',
  jqbh string comment '刷卡机编号',
  wzbh string comment '刷卡位置编号'
) COMMENT '[本科生门禁记录]'
PARTITIONED BY (dt string)
row format delimited
fields terminated by '\t'
stored as orc
TBLPROPERTIES('orc.compres'='SNAPPY');
