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
# -- 学号XH，挂科数gks，所在专业的平均成绩 zy_pjcj，本学期学生的平均成绩pjcj，所在专业平均挂科zy_pjgk，平均成绩击败百分比pjcj_jbb
sql="""
set mapred.output.compress=true;
set hive.exec.compress.output=true;
set mapred.output.compression.codec=org.apache.hadoop.io.compress.SnappyCodec;
set mapred.output.compression.type=block;
INSERT OVERWRITE TABLE adm.edu_adm_xs_cjfx PARTITION (dt='""" + data_day_str + """')
SELECT D1.XH, D1.XN, D1.XQM, D1.GKS, ZY.ZY_PJCJ, D1.PJCJ, ZY.ZY_PJGK, ROUND((100 - 100*D1.PJCJ_PM/D1.RS), 2) AS PJCJ_JBB
FROM
-- 学生各学期成绩：
 (SELECT A1.XH ,A1.XN ,A1.XQM ,A1.ZYM, A1.PJCJ, ROW_NUMBER() OVER(PARTITION BY A1.ZYM,A1.XN,A1.XQM ORDER BY A1.PJCJ DESC) AS PJCJ_PM, C1.RS, B1.GKS
	FROM
	(-- 学生各学期平均成绩
	  SElECT A.XH, A.ZYM, A.XN, A.XQM, SUM(A.KCCJ_JG * A.XF)/SUM(A.XF) AS PJCJ
	  FROM
	  (-- 成绩明细表
	    SELECT XH, XN, XQM, KCH, XF, ZYM, MAX(KCCJ_JG) AS KCCJ_JG
	    FROM
	     (SELECT XH,XN,XQM,KCH,XF,ZYM,KCCJ_JG FROM GDM.EDU_GDM_KC_KCCJ_DA WHERE dt='""" + data_day_str + """')CJMX
	    WHERE KCCJ_JG IS NOT NULL
	    GROUP BY XH, XN, XQM, KCH, XF, ZYM
	  ) A
	  GROUP BY A.XH, A.ZYM, A.XQM, A.XN
		ORDER BY XH
	) A1
	LEFT JOIN
	(-- GK明细表
	  SELECT B.XH, B.XN, B.XQM,COUNT(DISTINCT B.KCH) AS GKS
	  FROM 
	  (-- 成绩明细表
	    SELECT XH, XN, XQM, KCH, MAX(KCCJ_JG) AS KCCJ_JG
	    FROM
	     (SELECT XH,XN,XQM,KCH,KCCJ_JG FROM GDM.EDU_GDM_KC_KCCJ_DA WHERE dt='""" + data_day_str + """')CJMX1
	    WHERE KCCJ_JG IS NOT NULL
	    GROUP BY XH, XN, XQM, KCH
	  ) B
	  WHERE KCCJ_JG < '60'
	  GROUP BY B.XH, B.XN, B.XQM  
		ORDER BY XH
	) B1 ON A1.XH = B1.XH AND A1.XN=B1.XN AND A1.XQM=B1.XQM
	LEFT JOIN 
	(-- 本专业人数
		SELECT ZYM, COUNT(DISTINCT XH) AS RS
		FROM 
		  (SELECT XH,ZYM FROM GDM.EDU_GDM_KC_KCCJ_DA WHERE dt='""" + data_day_str + """')XHZY
		GROUP BY ZYM
	) C1 ON A1.ZYM = C1.ZYM
) D1

LEFT JOIN 
-- 专业各学期平均成绩：
	(SElECT A1.XN, A1.XQM, A1.ZYM, A1.PJCJ AS ZY_PJCJ, B1.GKS AS ZY_PJGK
	FROM 
	(-- 各学期专业平均成绩
		SELECT A.XN, A.XQM, A.ZYM, SUM(A.KCCJ_JG * A.XF)/SUM(A.XF) AS PJCJ
		FROM
		(-- 各学期成绩表
			SELECT XH, XN, XQM, KCH, ZYM, XF, MAX(KCCJ_JG) AS KCCJ_JG
			FROM 
			 (SELECT XH,XN,XQM,KCH,ZYM,XF,KCCJ_JG FROM GDM.EDU_GDM_KC_KCCJ_DA WHERE dt='""" + data_day_str + """')XHZY
			WHERE KCCJ_JG IS NOT NULL
			GROUP BY XH, XN, XQM, KCH, ZYM, XF
		) A
		GROUP BY A.XN, A.XQM, A.ZYM
	)A1
	LEFT JOIN
	(-- 各学期专业平均挂科数
		SElECT B.XN, B.XQM, B.ZYM, COUNT(DISTINCT KCH)/COUNT(DISTINCT XH) AS GKS
		FROM
		(-- 筛选挂科数据
			SELECT XH, XN, XQM, KCH, ZYM, MAX(KCCJ_JG) AS KCCJ_JG
			FROM 
			 (SELECT XH,XN,XQM,KCH,ZYM,KCCJ_JG FROM GDM.EDU_GDM_KC_KCCJ_DA WHERE dt='""" + data_day_str + """')XHZY
			WHERE  KCCJ_JG < 60
			GROUP BY XH, XQM, XN, KCH, ZYM
		) B
		GROUP  BY XN, XQM, ZYM
	)B1
	ON A1.XN = B1.XN AND A1.XQM = B1.XQM AND A1.ZYM = B1.ZYM
  ORDER BY A1.XQM
	)ZY
ON D1.ZYM=ZY.ZYM AND ZY.XQM=D1.XQM AND D1.XN=ZY.XN
ORDER BY XH DESC;
"""
hiveShell = 'hive -e "' + sql + '"'
print('su hdfs -c '+"'"+ hiveShell+"'")
os.system('su hdfs -c '+"'"+ hiveShell+"'")
print('finish--')
