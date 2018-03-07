
set hive.exec.dynamic.partition.mode=nonstrict;
INSERT OVERWRITE TABLE app.edu_app_ykt_xfjl PARTITION (dt)
SELECT XH,
       '学生',
       XM,
       XBM_MC,
       JYSJ,
       JYDD,
       ZDJH,
       JYLX,
       JYJE,
       JYYE,
       dt
  FROM gdm.gdm_ykt_jy_log
 WHERE  dt>='2016-01-01'  AND dt<='2016-12-31'  and  xh like '22%'
 
 
 
-- 三餐消费 2016年开始

set hive.exec.dynamic.partition.mode=nonstrict;
 INSERT OVERWRITE TABLE app.edu_app_ykt_scxf PARTITION (dt)
SELECT xh,
       xfrq,
       SUM(CASE
             WHEN jysj_h >= '06:00:00' AND jysj_h < '12:00:00' THEN
              jyje
             ELSE
              0
           END) AS zcxfje,
       MIN(CASE
             WHEN jysj_h >= '06:00:00' AND jysj_h < '12:00:00' THEN
              jysj
           END) as zxxfsj,
       SUM(CASE
             WHEN jysj_h >= '12:00:00' AND jysj_h < '16:00:00' THEN
              jyje
             ELSE
              0
           END) AS wcxfje,
       MIN(CASE
             WHEN jysj_h >= '12:00:00' AND jysj_h < '16:00:00' THEN
              jysj
           END) AS wcxfsj,
       
       SUM(CASE
             WHEN jysj_h >= '16:00:00' AND jysj_h < '24:00:00' THEN
              jyje
             ELSE
              0
           END) AS wacxfje,
       MIN(CASE
             WHEN jysj_h >= '16:00:00' AND jysj_h < '24:00:00' THEN
              jysj
           END) AS wacxfsj,
           MAX(dt)
  FROM (SELECT xh,
               SUBSTR(jysj, 1, 10) AS xfrq,
               SUBSTR(jysj, 12, 8) AS jysj_h,
               jysj,
               xfjl.jyje,dt
          FROM gdm.gdm_ykt_jy_log xfjl
         WHERE dt>='2018-01-01'  AND dt<='2018-04-01'
           AND jylx in ('消费')) tmp
 GROUP BY xh, xfrq;
 
 
 
 
 
 
 
 
 
 
 
 
 
 --门禁记录
 set hive.exec.dynamic.partition.mode=nonstrict;
 INSERT OVERWRITE TABLE app.edu_app_mj_mjjl PARTITION (dt)
SELECT XH, SKSJ, NULL,
 ACT,dt
  FROM fdm.fdm_xs_mj_log
 WHERE dt>='2017-06-01'  AND dt<='2018-06-01'   and  xh like '22%'
 
 
 
 
 
 
 
 
 --图书借阅
  set hive.exec.dynamic.partition.mode=nonstrict;
 INSERT OVERWRITE TABLE app.edu_app_ts_jyjl PARTITION (dt)
SELECT XH, JSRQ, TSMC, TSLB_MC, NULL, NULL, NULL, NULL,dt
  FROM gdm.gdm_ts_jy_log
 WHERE dt>='2017-01-01'  AND dt<='2017-06-01' and  xh like '22%'

 
