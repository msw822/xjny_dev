# -*-coding:utf-8-*-
import os
import sys
import datetime
if len(sys.argv) > 1:
    data_day_str = sys.argv[1]
    yesterday = str(sys.argv[1])
    if len(yesterday) == 8:
        data_day_str = yesterday[0:4] + '-' + yesterday[4:6] + '-' + yesterday[6:8]
else:
    today = datetime.date.today()
    oneday = datetime.timedelta(days=1)
    yesterday = today - oneday
    print 'yesterday:', yesterday
    data_day_str = str(yesterday)
    if len(data_day_str) == 8:
        data_day_str = yesterday[0:4] + '-' + yesterday[4:6] + '-' + yesterday[6:8]
#  -- 学号XH、总消费次数XF_CS、金额XF_JE、排名XF_JEPM（专业内）、月均消费额XF_YJXFE、消费金额击败百分比XF_JEJBB
sql = """
set mapred.output.compress=true; 
set hive.exec.compress.output=true; 
set mapred.output.compression.codec=org.apache.hadoop.io.compress.SnappyCodec; 
set mapred.output.compression.type=block;
INSERT OVERWRITE TABLE adm.edu_adm_zxxf PARTITION (dt='""" + data_day_str + """')
SELECT C.XH, C.XF_CS,ROUND( C.XF_JE,2), C.XF_JEPM, C.XF_YJXFE, ROUND((100 - 100*C.XF_JEPM/C.RS),2) AS XF_JEJBB
FROM
(
	SELECT A.XH, A.XF_JE, A.XF_CS, ROW_NUMBER() OVER (PARTITION BY A.ZYM ORDER BY XF_JE DESC) AS XF_JEPM, B.RS, A.XF_YJXFE	       
	FROM
	(
		SELECT XH, ZYM, COUNT(*) AS XF_CS, SUM(JYJE) AS XF_JE,
		ROUND(
		SUM(JYJE)/months_between(
		concat(substr(MAX(SUBSTR(JYRQ,1,8)),1,4),'-',substr(MAX(SUBSTR(JYRQ,1,8)),5,2),'-',substr(MAX(SUBSTR(JYRQ,1,8)),7,2)), 
		concat(substr(MIN(SUBSTR(JYRQ,1,8)),1,4),'-',substr(MIN(SUBSTR(JYRQ,1,8)),5,2),'-',substr(MIN(SUBSTR(JYRQ,1,8)),7,2))
		)
		,2)  AS XF_YJXFE                    		      		                             
		FROM 
		 (SELECT XH,ZYM,JYJE,JYRQ FROM GDM.EDU_GDM_YKT_JY_DA WHERE dt='""" + data_day_str + """')RQJE
		GROUP BY XH, ZYM
	) A
	LEFT JOIN
	(SELECT ZYM, COUNT(DISTINCT XH) AS RS FROM 
	  (SELECT XH,ZYM FROM GDM.EDU_GDM_YKT_JY_DA WHERE dt='""" + data_day_str + """')xhzy
	 GROUP BY ZYM
	) B
	ON A.ZYM = B.ZYM
) C
;
"""
hiveShell = 'hive -e "' + sql + '"'
print('su hdfs -c '+"'"+ hiveShell+"'")
os.system('su hdfs -c '+"'"+ hiveShell+"'")
print('finish--')
