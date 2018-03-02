--  DESCRIPTION: 校区信息表
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
DROP TABLE IF EXISTS dim_xq;
CREATE EXTERNAL TABLE dim_xq (
  XQH string COMMENT '校区号,学校自编',
  XQMC string COMMENT '校区名称',
  XQDZ string COMMENT '校区地址指包括省（自治区、直辖市）/地（市、州）/县（区、旗）/乡（镇）/街（村）/门牌号的详细地址',
  XQYZBM string COMMENT '校区邮政编码',
  XQLXDH string COMMENT '校区联系电话',
  XQCZDH string COMMENT '校区传真电话',
  XQFZRH string COMMENT '校区负责人号,学号或工号'
) COMMENT '[校区信息表]关于校区的维度表'
row format delimited
fields terminated by '\t'
STORED AS textfile
;
