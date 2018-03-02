# 
# 判断日期（第一个参数）
if [[ $# -eq 0 ]]; then
	date="$date"
else
	date=$1
fi
echo "生成日期为$date的gdm数据"
base=$(cd `dirname $0`; pwd)
cd `dirname $0`

# 建表
echo "创建dim fdm gdm表"
python script/exe_table_create.py "$base"/table/dim "$base"/table/fdm "$base"/table/gdm 

# 导入dim和fdm数据
su hdfs -c "hadoop fs -put $base/exp/fdm.db  /apps/hive/warehouse/;hadoop fs -put exp/dim.db  /apps/hive/warehouse/"

# 修复fdm分区
python exp/repair.py

# 生成gdm数据
echo python script/exeute/gdm/gdm_xs_jbxx_da.py "$date"
python script/execute/gdm/gdm_xs_jbxx_da.py "$date"

echo python script/exeute/gdm/gdm_jzg_da.py "$date"
python script/exeute/gdm/gdm_jzg_da.py "$date"

echo python script/exeute/gdm/gdm_kc_kccj_da.py "$date"
python script/exeute/gdm/gdm_kc_kccj_da.py "$date"

echo python script/exeute/gdm/gdm_ky_xm_da.py "$date"
python script/exeute/gdm/gdm_ky_xm_da.py "$date"

echo python script/exeute/gdm/gdm_ky_zl_da.py "$date"
python script/exeute/gdm/gdm_ky_zl_da.py "$date"

echo python script/exeute/gdm/gdm_ky_zz_da.py "$date"
python script/exeute/gdm/gdm_ky_zz_da.py "$date"

echo python script/exeute/gdm/gdm_ky_detail_sum.py "$date"
python script/exeute/gdm/gdm_ky_detail_sum.py "$date"

echo python script/exeute/gdm/gdm_sw_log.py "$date"
python script/exeute/gdm/gdm_sw_log.py "$date"

echo python script/exeute/gdm/gdm_ts_jyjl_da.py "$date"
python script/exeute/gdm/gdm_ts_jyjl_da.py "$date"

echo python script/exeute/gdm/gdm_ykt_jy_log.py "$date"
python script/exeute/gdm/gdm_ykt_jy_log.py "$date"