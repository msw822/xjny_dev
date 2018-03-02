--  DESCRIPTION: fdm->gdm 流水表---- 一卡通交易、门禁记录、图书借阅记录
--     OPTIONS: ---
-- REQUIREMENTS: ---
--        BUGS: ---
--        NOTES: ---
--       AUTHOR: mashaowei@h3c.com
--     COMPANY: h3c.bigdata
--      VERSION: 1.0
--     CREATED: 2018/02/26
--    REVIEWER:
--    REVISION:

SET mapred.output.compress = true;
SET hive.exec.compress.output = true;
SET mapred.output.compression.codec = org.apache.hadoop.io.compress.SnappyCodec;
SET mapred.output.compression.type = block;


set hive.exec.dynamic.partition.mode=nonstrict;

--  DESCRIPTION: fdm->gdm 一卡通交易信息表(gdm_ykt_jy_log) 动态分区     
INSERT  overwrite table gdm.gdm_ykt_jy_log PARTITION (dt)
SELECT 
  E.XH,
  B.XM,
  B.XBM,
  B.XBM_MC,
  B.RXNY ,
  B.SZNJ,
  B.SZBH,
  B.BJMC,
  B.ZYM ,
  B.ZYM_MC ,
  B.SSYXM ,
  B.SSYXM_MC,
  B.PYCCM,
  B.PYCCM_MC,
  B.SFZJH,
  B.CSRQ ,
  A.KH ,
  A.KXL,
  A.JYLX,
  A.JYJE,
  A.JYLSH,
  A.JYRQ,
  A.JYSJ ,
  A.JYDD,
  A.SHDM,
  C.SHMC,
  C.SHLBDM,
  C.SHLBMC,
  A.ZDJH,
  A.LJYKCS,
  A.JYYE,
  B.LYDQM,
  NVL(B.LYDQM_SM,'其他'),
  B.JGM,
  NVL(B.JGM_SM,'其他'),
  A.dt
FROM (SELECT KH,KXL,JYLX,JYJE,JYLSH,JYRQ,JYSJ,JYDD,SHDM,ZDJH,LJYKCS,JYYE,dt FROM fdm.fdm_ykt_jy_log  WHERE dt>='2013-01-01'  AND dt<='2014-01-01') A 
LEFT OUTER JOIN (SELECT XH,KH FROM fdm.fdm_ykt_xx WHERE dt='2999-12-31') E ON A.KH = E.KH
LEFT OUTER JOIN (SELECT XH,XM,XBM,XBM_MC,RXNY,SZNJ,SZBH,BJMC,ZYM,ZYM_MC,SSYXM,SSYXM_MC,PYCCM,PYCCM_MC,SFZJH,CSRQ,LYDQM,LYDQM_SM,JGM,JGM_SM FROM gdm.gdm_xs_jbxx_da WHERE dt='2999-12-31') B ON E.XH = B.XH
LEFT OUTER JOIN (SELECT SHMC,SHLBDM,SHDM,SHLBMC FROM fdm.fdm_ykt_shxx WHERE dt='2999-12-31') C ON A.SHDM = C.SHDM;




--  DESCRIPTION: fdm->gdm 图书借阅信息表(gdm_ts_jy_log) 动态分区  

set hive.exec.dynamic.partition.mode=nonstrict;

INSERT OVERWRITE TABLE gdm.gdm_ts_jy_log PARTITION (dt)
SELECT A.TSTM, 
A.TSMC, 
A.DZTM, 
A.SFRZH, 
B.XH,    
D.XM, 
D.XBM, 
D.XBM_MC, 
D.RXNY, 
D.SZNJ, 
D.SZBH, 
D.BJMC, 
D.ZYM, 
D.ZYM_MC,       
D.SSYXM, 
D.SSYXM_MC, 
D.PYCCM, 
D.PYCCM_MC,
D.SFZJH, 
D.CSRQ,
A.JSRQ, 
A.YHRQ, 
A.DZXM, 
A.WJSJ, 
A.XJCS, 
A.CSBM, 
A.CSMC,
C.DM, 
C.MC,
A.dt
FROM (SELECT TSTM,TSMC,DZTM,SFRZH,JSRQ,YHRQ,DZXM,WJSJ,XJCS,CSBM,CSMC,dt FROM FDM.fdm_ts_jy_log WHERE dt>='2018-01-01'  AND dt<='2018-03-01') A
LEFT OUTER JOIN (SELECT XH,DZTM FROM FDM.FDM_TS_DZXX WHERE dt='2999-12-31') B ON A.DZTM = B.DZTM
LEFT OUTER JOIN (select /*+ mapjoin(C)*/ * from DIM.hb_tslb) C ON subSTR(A.TSTM, 1, 1) = c.dm
LEFT OUTER JOIN (SELECT XH,XM,XBM, XBM_MC,RXNY,SZNJ,SZBH,BJMC,ZYM,ZYM_MC,SSYXM,SSYXM_MC,PYCCM,PYCCM_MC,SFZJH,CSRQ FROM GDM.gdm_xs_jbxx_da WHERE dt='2999-12-31') D ON B.XH =D.XH;