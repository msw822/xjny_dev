--  DESCRIPTION: ods->dim 码表主题---- 
--     OPTIONS: ---
-- REQUIREMENTS: ---
--        BUGS: ---
--        NOTES: ---
--       AUTHOR: li.xiwang@h3c.com
--     COMPANY: h3c.bigdata
--      VERSION: 1.0
--     CREATED: 2018/02/09
--    REVIEWER:
--    REVISION:

SET mapred.output.compress = true;
SET hive.exec.compress.output = true;
SET mapred.output.compression.codec = org.apache.hadoop.io.compress.SnappyCodec;
SET mapred.output.compression.type = block;

--  DESCRIPTION: ods->DIM 性别表（hb_xb)	
INSERT OVERWRITE TABLE DIM.hb_xb				
SELECT
xbDM,
xbMC
FROM
ods.ods_usr_xg_new_t_zxbz_xb;
--  DESCRIPTION: ods->dim 民族表(hb_mz)
INSERT OVERWRITE TABLE DIM.hb_mz				
SELECT
MZDM,
MZMC,
NULL
FROM 
ods.ods_usr_xg_new_t_zxbz_mz;
--  DESCRIPTION: ods->dim 身份证件类型表（hb_sfzjlx)
INSERT OVERWRITE TABLE DIM.hb_sfzjlx				
SELECT
SFZJLXDM,
SFZJLXMC
FROM 
ods.ods_usr_xg_new_t_zxbz_sfzjlx;
--  DESCRIPTION: ods->dim   婚姻状态表(hb_hyzt)
INSERT OVERWRITE TABLE DIM.hb_hyzt
SELECT 
HYZKDM,
HYZKMC
FROM 
ods.ods_usr_xg_new_T_ZXBZ_HYZK;
--  DESCRIPTION: ods->dim   港澳台侨外表(hb_gatqw)
INSERT OVERWRITE TABLE DIM.hb_gatqw
SELECT
GATQDM,
GATQMC,
NULL
from    
ods.ods_usr_xg_new_T_ZXBZ_GATQ;

--  DESCRIPTION: ods->dim   政治面貌表(hb_zzmm)
INSERT OVERWRITE TABLE DIM.hb_zzmm
SELECT
ZZMMDM,
ZZMMMC,
ZZMMJC
from
ods.ods_usr_xg_new_T_ZXBZ_ZZMM;

--  DESCRIPTION: ods->dim   健康状况表(hb_jkzk)
INSERT OVERWRITE TABLE DIM.hb_jkzk
SELECT 
DM,
MC,
null
from
ods.ods_usr_xg_new_T_ZXBZ_JKZK;

--  DESCRIPTION: ods->dim   血型表(hb_xx)
INSERT OVERWRITE TABLE DIM.hb_xx
SELECT
xxdm,
xxmc,
NULL
from
ods.ods_usr_xg_new_T_ZXBZ_XX;

--  DESCRIPTION: ods->dim   来源地区码(hb_xzqh)
INSERT OVERWRITE TABLE DIM.hb_xzqh
SELECT
XZQHDM,
XZQHMC,
NULL,
NULL,
NULL,
NULL,
NULL,
NULL
from
ods.ods_usr_xg_new_T_ZXBZ_XZQH;

--  DESCRIPTION: ods->dim   国家地区表(hb_gjdq)
INSERT OVERWRITE TABLE DIM.hb_gjdq
SELECT
GJDQJM,
GJDQMC,
NULL,
NULL
from
ods.ods_usr_xg_new_T_ZXBZ_GJDQ;
--  DESCRIPTION: ods->dim   学生类别表(hb_xslb)
INSERT OVERWRITE TABLE DIM.hb_xslb
SELECT
xslbdm,
xslbmc
from
ods.ods_usr_xg_new_t_zxbz_xslb;

--  DESCRIPTION: ods->dim  本专科专业表(hb_bzkzy)
INSERT OVERWRITE TABLE DIM.hb_bzkzy
SELECT
zydm,
ZYMC,
NULL,
NULL
from
ods.ods_usr_gxsj_t_bzks_zy;

--  DESCRIPTION: ods->dim  单位表(dim_dw)
INSERT OVERWRITE TABLE DIM.dim_dw	
SELECT
dwdm,
dwmc,
NULL,
NULL,
NULL,
NULL,
lsdwh,
lbm,
NULL,
DWYXBSdm,
NULL,
sfstdm,
NULL,
NULL,
NULL,
NULL,
NULL,
NULL
from
ods.ods_usr_gxsj_t_dw;