#!/bin/bash

timeStr=`date -d yesterday '+%Y-%m-%d'`
dbname=app;
tablename=edu_app_ykt_xfjl;
cd /opt/h3c/dw_hadoop/script/execute/fdm

mysql -h  10.5.1.21 -uroot -p123456 << EOF
use $dbname;

DELETE  FROM edu_app_ykt_xfjl WHERE  DATE_FORMAT(jysj,'%Y-%m-%d')="$timeStr";

EOF

sleep 10
echo -e " DELETE Mysql  edu_app_ykt_xfjl DATA IN $timeStr finish==="
echo -e "BEGIN INSERT INTO  edu_app_ykt_xfjl DATA  IN  $timeStr "

#插入昨日数据

sql="
set mapred.output.compress=true; 
set hive.exec.compress.output=true; 
set mapred.output.compression.codec=org.apache.hadoop.io.compress.SnappyCodec; 
set mapred.output.compression.type=block;

DROP TABLE IF EXISTS  tmp.tmp_ykt_xfjl;
CREATE TABLE tmp.tmp_ykt_xfjl AS SELECT sfrzm,sflx,xm,xb,jysj,jydd,poscode,jylx,jyje,zhye,dt FROM app.edu_app_ykt_xfjl WHERE dt=\"$timeStr\";"
echo $sql;

su hdfs -c "hive -e 'set mapred.output.compress=true; 
set hive.exec.compress.output=true; 
set mapred.output.compression.codec=org.apache.hadoop.io.compress.SnappyCodec; 
set mapred.output.compression.type=block;

DROP TABLE IF EXISTS  tmp.tmp_ykt_xfjl;
CREATE TABLE tmp.tmp_ykt_xfjl AS SELECT sfrzm,sflx,xm,xb,jysj,jydd,poscode,jylx,jyje,zhye,dt FROM app.edu_app_ykt_xfjl WHERE dt=\"$timeStr\";' "


su hdfs -c "sqoop export --connect  'jdbc:mysql://10.5.1.21:3306/app?useUnicode=true&characterEncoding=utf-8'  --username 'root' --password '123456'  --table  'edu_app_ykt_xfjl'  --hcatalog-database 'tmp' --hcatalog-table 'tmp_ykt_xfjl'  --driver com.mysql.jdbc.Driver  "