#    -*-coding:utf-8-*-
# List SQL file(s) or directory(s) which contains SQL files(only) behind this script as argv.
import os
import sys

#获取当前目录 /opt/edu_dw_hadoop
base=os.getcwd()
print(base)
parent_path=os.path.abspath(os.path.dirname(base)+os.path.sep+".")
print("创建dim fdm gdm adm app")
# 创建数据库dim fdm gdm
os.system("""
su hdfs -c "hive -e '
create database if not exists dim;
create database if not exists gdm;
create database if not exists fdm;
create database if not exists adm;
create database if not exists app;
'"
""")

cnt_s = 0
cnt_f = 0
failList = []
l = len(sys.argv)
for n in range(1, l):
    sql = parent_path+"/table/"+sys.argv[n]
    print sql
    # 如果参数是sql文件,直接执行
    if os.path.isfile(sql):
        tabName = sql
        print 'now executing ' + sql
        status = os.system("""su hdfs -c \"hive -f""" + sql + """\"""")
        if status == 0:
            cnt_s = cnt_s + 1
            print tabName, ' created successfully!'
        else:
            cnt_f = cnt_f + 1
            failList.append(tabName)
            print tabName, ' created failed'
        print cnt_s, ' success , ', cnt_f, ' fail'
    #   如果参数是文件夹名，遍历下面的sql文件
    else:
        for i in os.listdir(sql):
            tabName = i
            j = os.path.join(sql, i)
            print 'now executing ' + j
            status = os.system("""su hdfs -c \"hive -f""" + j + """\"""")

            if status == 0:
                cnt_s = cnt_s + 1
                print tabName, ' created successfully!'
            else:
                cnt_f = cnt_f + 1
                failList.append(tabName)
                print tabName, ' created failed'
            print cnt_s, ' success , ', cnt_f, ' fail'
# 建表失败则打印　失败的表名
if cnt_f != 0:
    print 'failed: ', failList

# 导入dim和fdm数据
os.system("""su hdfs -c "hadoop fs -put """+base+"""/exp/fdm.db  /apps/hive/warehouse/;hadoop fs -put exp/dim.db  /apps/hive/warehouse/"
""")
# 修复fdm分区
# python parent_path+os.path.sep+"exp/repair.py"
print('finish--')
