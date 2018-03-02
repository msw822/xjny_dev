--  DESCRIPTION: 一卡通信息表
--
--     OPTIONS: ---
-- REQUIREMENTS: ---
--        BUGS: ---
--        NOTES: ---
--       AUTHOR: song.shengjie@h3c.com
--     COMPANY: h3c.bigdata
--      VERSION: 1.0
--     CREATED: 2017/08/11
--    REVIEWER:
--    REVISION:
DROP TABLE IF EXISTS fdm.fdm_ykt_xx;
CREATE EXTERNAL TABLE IF NOT EXISTS fdm.fdm_ykt_xx(
KH string COMMENT '账号或卡号'
,HSDW string COMMENT '核算单位'
,KXL INT  COMMENT '卡ID(卡序列)'
,JKXL INT  COMMENT '旧卡ID(卡序列)'
,SFXL string COMMENT '身份序列'
,XM string COMMENT '姓名'
,XBM string COMMENT '性别码 见HB性别表[hb_xb]'
,SFDM string COMMENT '身份代码'
,BMDM string COMMENT '部门代码'
,RXFXE INT  COMMENT '日消费限额'
,ZHYE INT  COMMENT '账户余额'
,KNYE INT  COMMENT '卡内余额'
,YJ INT  COMMENT '押金'
,DQGDYE INT  COMMENT '当前过渡余额'
,SCGDYE INT  COMMENT '上次过渡余额'
,DQBZXLH INT  COMMENT '当期补助序列号'
,SCBZXLH INT  COMMENT '上次补助序列号'
,LJYKCS INT  COMMENT '累计用卡次数'
,ZDZZJJE INT  COMMENT '自动转账警戒额'
,ZDZZE INT  COMMENT '自动转账额'
,GLFJFL INT  COMMENT '管理附加费率'
,CXMM string COMMENT '查询密码'
,YHZH string COMMENT '银行帐号'
,ZJH string COMMENT '证件号'
,ZJLX string COMMENT '证件类型'
,XH string COMMENT '学工号'
,YDDH string COMMENT ' 移动电话 '
,KHRQ string COMMENT '开户日期/注册日期YYYYMMDD'
,YXRQ string COMMENT '有效日期YYYYMMDD'
,KLX string COMMENT ' 卡类型 '
,ZHBJ string COMMENT ' 账户标记 '
,GXRQ string COMMENT ' 更新日期 '
,SZQM string COMMENT '数字签名 '
,KPZT string COMMENT '卡片状态 '
) COMMENT '[一卡通信息表]一卡通当前基础信息'
PARTITIONED BY ( 
  dt string)
row format delimited
fields terminated by '\t'
stored as orc
TBLPROPERTIES('orc.compres'='SNAPPY');


