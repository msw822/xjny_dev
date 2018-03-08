#!/bin/bash

timeStr=`date "+%Y-%m-%d" -d  '1 month ago'` 

cd /opt/h3c/dw_hadoop/script/execute/fdm
python fdm_xs_kscj.py $timeStr


cd /opt/h3c/dw_hadoop/script/execute/gdm
python gdm_kc_kccj_xq.py $timeStr


cd /opt/h3c/dw_hadoop/script/execute/app
python edu_app_ks_cjbj.py $timeStr
python edu_app_kc_kcap.py $timeStr
python edu_app_ks_cjjl.py $timeStr