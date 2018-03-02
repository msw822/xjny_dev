# -*- coding:utf-8-*-
# requirement:gdm_ky_detail_sum gdm_ky_xm_da gdm_ky_zl_da
import sys
import os
import datetime

if(len(sys.argv)>1):
    data_day_str = sys.argv[1]
    yesterday = str(sys.argv[1])
    if len(yesterday) == 8:
        data_day_str = yesterday[0:4]+'-'+yesterday[4:6]+'-'+yesterday[6:8]
else:
    today=datetime.date.today()
    oneday=datetime.timedelta(days=1)
    yesterday=today-oneday
    print 'yesterday:',yesterday
    data_day_str=str(yesterday)
    if len(data_day_str) == 8:
        data_day_str = yesterday[0:4]+'-'+yesterday[4:6]+'-'+yesterday[6:8]
sql = """
set mapred.output.compress=true; 
set hive.exec.compress.output=true; 
set mapred.output.compression.codec=org.apache.hadoop.io.compress.SnappyCodec; 
set mapred.output.compression.type=block;
INSERT OVERWRITE table gdm.gdm_ky_detail_sum PARTITION(dt='"""+data_day_str+"""')
SELECT * FROM (
SELECT
	DWH,
	DWMC,
	XMBH AS KY_BH,
	XMMC AS KY_MC,
	XMLBM_MC AS KY_LX_MC,
	'项目' AS KY_LB,
	NULL AS HJMC,
	XMJBM AS KY_JB,
	XMFZRH AS KY_ZZ,
	JXRQ AS KY_RQ
FROM
	(SELECT DWH,DWMC,XMBH,XMMC,XMLBM_MC,XMJBM,XMFZRH,JXRQ 
	FROM gdm.gdm_ky_xm_da WHERE dt='"""+data_day_str+"""') xm

UNION ALL

SELECT
	COALESCE (DWH_ZL, DWH_RY) AS DWH,
	COALESCE (DWMC_ZL, DWMC_RY) AS DWMC,
	ZLCGBH AS KY_BH,
	ZLCGMC AS KY_MC,

	ZLLXM_MC AS KY_LX_MC,
	'专利' AS KY_LB,
	NULL AS HJMC,
	NULL AS KY_JB,
	XM AS KY_ZZ,
	PZRQ AS KY_RQ
FROM
	(SELECT DWH_ZL, DWH_RY,DWMC_ZL, DWMC_RY,ZLCGBH,ZLCGMC,ZLLXM_MC,XM,PZRQ
	 FROM gdm.gdm_ky_zl_da WHERE dt='"""+data_day_str+"""')zl

UNION ALL

SELECT
	COALESCE(DWH_ZZ,DWH_RY) AS DWH,
    COALESCE(DWMC_ZZ,DWMC_ZZ) AS DWMC,
	ZZBH AS KY_BH,
	ZZZWMC AS KY_MC,
	
	LZLBM_MC AS KY_LX_MC,
	'专著' AS KY_LB,
	NULL AS HJMC,
	NULL AS KY_JB,
	XM AS KY_ZZ,
	CBRQ AS KY_RQ
FROM
	(SELECT DWH_ZZ,DWH_RY,DWMC_ZZ,ZZBH,ZZZWMC,LZLBM_MC,XM,CBRQ
	 FROM gdm.gdm_ky_zz_da WHERE dt='"""+data_day_str+"""') kyzz
) t1
;
"""
hiveShell = """su hdfs -c \"hive -e \\\"""" + sql + """\\\"\""""
print(hiveShell)
os.system(hiveShell)
