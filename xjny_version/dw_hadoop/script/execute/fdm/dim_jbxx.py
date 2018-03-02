# -*-coding:utf-8-*-

import os
import sys
import datetime

#获取外部日期参数，如果传参则data_day_str为传递的参数，如果未传参data_day_str为昨天的日期
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

data_day_str='2999-12-31'
###########################################################
# 运行的时候将分区字段替换成  dt = '"""+data_day_str+"""' #
###########################################################


sql = """
set mapred.output.compress=true; 
set hive.exec.compress.output=true; 
set mapred.output.compression.codec=org.apache.hadoop.io.compress.SnappyCodec; 
set mapred.output.compression.type=block;



--  DESCRIPTION: ods->dim   学生类别表(hb_xslb)
INSERT OVERWRITE TABLE DIM.hb_xslb
SELECT
xslbdm,
xslbmc
from
ods.ods_usr_xg_new_t_zxbz_xslb where dt = '"""+data_day_str+"""';

--  DESCRIPTION: ods->dim  本专科专业表(hb_bzkzy)
INSERT OVERWRITE TABLE DIM.hb_bzkzy
SELECT
zydm,
ZYMC,
NULL,
NULL
from
ods.ods_usr_gxsj_t_bzks_zy where dt = '"""+data_day_str+"""';

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
ods.ods_usr_gxsj_t_dw  where dt = '"""+data_day_str+"""';




--  DESCRIPTION: ods->dim  班级表(dim_bjxx)
INSERT OVERWRITE TABLE DIM.dim_bjxx SELECT
    A.bh,
    A.bjmc,
    A.bjjc,
    NULL,
    A.nj,
    A.BZRZGH,
    NULL,
    NULL,
    NULL,
    A.YXDM,
    B.DWMC,
    A.ZYDM,
    C.ZYMC,
    NULL,
    NULL,
    A.XZ,
    NULL,
    NULL
FROM
    (
        SELECT
            bh,
            bjmc,
            bjjc,
            nj,
            BZRZGH,
            YXDM,
            ZYDM,
            XZ
        FROM
            ods.ods_usr_gxsj_T_BZKS_XZB where dt = '"""+data_day_str+"""'
    ) A
LEFT JOIN (SELECT DWDM,
 DWMC
FROM
    ods.ods_usr_gxsj_t_dw )B ON A.YXDM = B.DWDM
LEFT JOIN (SELECT ZYDM,
 ZYMC
FROM
    ods.ods_usr_gxsj_t_bzks_zy  where dt = '"""+data_day_str+"""') C ON A.ZYDM = C.ZYDM;

"""

#hiveShell = 'hive -e "' + sql + '"'

hiveShell = """su hdfs -c \"hive -e \\\"""" + sql + """\\\"\""""
print(hiveShell)
os.system(hiveShell)
print('finish--')