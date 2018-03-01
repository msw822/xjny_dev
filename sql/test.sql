INSERT INTO fdm.edu_t_kccjjbxx
  (XH,
   XN,
   XQM,
   KCH,
   KCCJ,
   KCCJ_JG,
   PSCJ,
   ZSCJ,
   QZCJ,
   QMCJ,
   SYCJ,
   CJLRRQ,
   CJLRSJ,
   ZYM_KC,
   BJH_KC,
   JXBH,
   XF,
   XF_HD,
   XS,
   KCXZM,
   KCLBM,
   KCGSM,
   PM)
  SELECT XH,
         XN,
         XQ,
         KCDM,
         CJ,
         CASE
           WHEN CJ <= '99.9' OR CJ IN ('100','100.0') THEN
            CJ
           WHEN ZSCJ IS NOT NULL THEN
            ZSCJ
           WHEN CJ in ('优秀') THEN
            '90'
           WHEN CJ in ('良好', '良') THEN
            '80'
           WHEN CJ in ('中等', '通过') THEN
            '70'
           WHEN CJ in ('及格', '免体', '免训', '免考', '交换') THEN
            '60'
           WHEN CJ IN
                ('免修', '缺考', '退学', '作弊', '不通过', '不及格', '缺作业', '旷考', '缺项', '休学') THEN
            '0'
           ELSE
            '0'
         END AS KCCJ_JG,
         PSCJ,
         ZSCJ,
         QZCJ,
         QMCJ,
         SYCJ,
         DATE_FORMAT(CZSJ, '%Y%m%d'),
         date_format(CZSJ, '%Y-%m-%d %H:%m:%s'),
         ZYDM,
         BJDM,
         JXBH,
         XF,
         CASE 
            WHEN (CJ>='60' AND CJ <='99.9') THEN XF
            WHEN CJ in ('100','100.0') THEN XF
            WHEN CJ< '60' THEN 0
            WHEN ZSCJ >= 60 THEN XF
            WHEN CJ in ('优秀') THEN XF 
            WHEN CJ in ('良好','良') THEN XF 
            WHEN CJ in ('中等', '通过') THEN XF 
            WHEN CJ in ('及格','免体', '免训', '免考', '交换') THEN XF
            WHEN CJ IN ('缓补', '缓体', '缓考', '缓训','后补') AND ZSCJ >= 60 THEN  XF
            WHEN CJ IN ('免修','缺考', '退学', '作弊', '不通过', '不及格', '缺作业', '旷考', '缺项', '休学', '待处理') THEN 0
            ELSE 0 
         END AS XF_HD,
         XS,
         KCXZDM,
         KCLBDM,
         KCGSDM,
         PM
    FROM bh_byshx_ods.t_bzks_cj_xscjb;