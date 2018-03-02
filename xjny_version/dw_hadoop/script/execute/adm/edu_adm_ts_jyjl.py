# -*-coding:utf-8-*-
import os
import sys
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
sql = """
set mapred.output.compress=true; 
set hive.exec.compress.output=true; 
set mapred.output.compression.codec=org.apache.hadoop.io.compress.SnappyCodec; 
set mapred.output.compression.type=block;
INSERT OVERWRITE TABLE adm.edu_adm_ts_jyjl PARTITION (dt='""" + data_day_str + """')
-- 学号，册数，次数，最喜欢类别，最喜欢的书，借阅册数在专业内排名
SELECT A.XH,A.JYCES,B.JYCIS,LB.TSLB,FAV.TSTM,JB.JBB
FROM
-- 借阅总册数：
	(SELECT XH,COUNT(XH) AS JYCES
	 FROM 
		(SELECT XH,TSTM,count(*) as DBJYCIS FROM 
		 (SELECT XH,TSTM FROM gdm.edu_gdm_ts_jyjl_da WHERE dt='""" + data_day_str + """')XHTSTM
		group by XH,TSTM ORDER BY DBJYCIS DESC) A1
	 GROUP BY XH
	)A
LEFT JOIN 
-- 获得借阅总次数 ：(本*次):
	(SELECT XH,COUNT(XH)AS JYCIS FROM 
	  (SELECT XH FROM gdm.edu_gdm_ts_jyjl_da WHERE dt='""" + data_day_str + """') GDMXH
	 GROUP BY XH ORDER BY JYCIS DESC) B
ON A.XH=B.XH
LEFT JOIN
-- 最喜欢的类别：
	(SELECT C1.XH,C1.TSLB,C.CIS AS LBCNT FROM
		(SELECT XH,MAX(LBJYCIS) AS CIS FROM
			(SELECT XH,TSLB,COUNT(*) AS LBJYCIS FROM 
			 (SELECT XH,TSLB FROM gdm.edu_gdm_ts_jyjl_da WHERE dt='""" + data_day_str + """')XHTSLB
			 GROUP BY XH,TSLB ORDER BY XH DESC)C1
		GROUP BY XH ORDER BY CIS DESC
		)C
	LEFT JOIN 
		(SELECT XH,TSLB,COUNT(*) AS LBJYCIS FROM 
		  (SELECT XH,TSLB FROM gdm.edu_gdm_ts_jyjl_da WHERE dt='""" + data_day_str + """')XHTSLB
		 GROUP BY XH,TSLB ORDER BY XH DESC)C1
	ON C1.XH=C.XH AND C1.LBJYCIS=C.CIS
-- 	ORDER BY XH DESC
	)LB
ON LB.XH=A.XH

LEFT JOIN
-- 最喜欢的书： 多本？
-- 借阅最喜欢的次数
	(
	SELECT A1.XH,A1.TSTM,A.CIS AS CNT FROM
		(SELECT XH,MAX(DBJYCIS)AS CIS FROM
			(SELECT XH,TSTM,count(*) as DBJYCIS FROM 
			  (SELECT XH,TSTM FROM gdm.edu_gdm_ts_jyjl_da WHERE dt='""" + data_day_str + """')XHTSTM
			 group by XH,TSTM ORDER BY DBJYCIS DESC) A1 
		GROUP BY XH ORDER BY CIS DESC
		)A
	LEFT JOIN
		(SELECT XH,TSTM,count(*) as DBJYCIS FROM 
		  (SELECT XH,TSTM FROM gdm.edu_gdm_ts_jyjl_da WHERE dt='""" + data_day_str + """')XHTSTM
		 group by XH,TSTM ORDER BY DBJYCIS DESC) A1 
	ON A1.XH=A.XH AND A1.DBJYCIS=A.CIS
	ORDER BY XH DESC
	)FAV
ON FAV.XH=A.XH

LEFT JOIN

-- 击败专业比：
	(SELECT D.XH, D.ZYM,ROUND((100 - 100*D.TS_JSCES_PM/E.RS), 2) AS JBB
	FROM
		(
			SELECT B.XH, 
			B.ZYM, 
			ROW_NUMBER() OVER(PARTITION BY B.ZYM ORDER BY B.JSCES DESC) AS TS_JSCES_PM
			FROM  
			-- B 每个学号对应的借阅册数,得到排名
			(SELECT XH, ZYM, COUNT(DISTINCT TSTM) AS JSCES
				FROM 
				 (SELECT XH,ZYM,TSTM FROM gdm.edu_gdm_ts_jyjl_da WHERE dt='""" + data_day_str + """')ZYTSTM
				GROUP BY XH, ZYM) B  
		) D
	LEFT JOIN
		(
		-- 各专业对应人数
			SELECT ZYM, COUNT(DISTINCT XH) AS RS
			FROM 
			 (SELECT XH,ZYM FROM gdm.edu_gdm_ts_jyjl_da WHERE dt='""" + data_day_str + """')XHZY
			GROUP BY ZYM
		) E					
	ON D.ZYM = E.ZYM
	)JB
ON A.XH=JB.XH;
"""
hiveShell = 'hive -e "' + sql + '"'
print('su hdfs -c '+"'"+ hiveShell+"'")
os.system('su hdfs -c '+"'"+ hiveShell+"'")
print('finish--')
