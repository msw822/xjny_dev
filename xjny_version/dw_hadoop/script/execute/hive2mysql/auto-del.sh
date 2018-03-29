#!/bin/sh  
  
#如果没有输入变更值，默认天数为15  
FilePath=/tmp/xjny_daily  
   
  
if [ ! -n "$1" ];  
then  
    day=15  
else  
    day=$1  
fi  
  
#删除15天之前的文件夹  
echo "输出日志文件夹："  
echo "find $FilePath -type d -ctime +$day > $File"  
find $FilePath -name 'data*' -type d  -ctime +$day > $File  
  
echo "删除从hive定期导出文件目录"  
echo "find $FilePath -name 'data*' -type d  -ctime +$day  | xargs rm -rf"  
echo $File 

find /tmp/xjny_daily/ -name   'data*' -type d    -ctime  +$day  | xargs rm -rf
