# -*-coding:utf-8-*-

#Repair fdm tables partition.
import os
cnt_s = 0
cnt_f = 0
failList = []
tablesStr = '''
fdm_bks_tsgmj
fdm_ccwzlxxx
fdm_jlhdxx
fdm_jxjxx
fdm_jzg_jbxx
fdm_jzg_jxcgj
fdm_kc_cjjbxx
fdm_kc_jbxx
fdm_kc_jspj
fdm_kc_pk
fdm_kc_xsxkxx
fdm_kcqd
fdm_ky_cgj_ry
fdm_ky_lw
fdm_ky_lw_attr
fdm_ky_lw_ry
fdm_ky_lwfb
fdm_ky_xm
fdm_ky_xm_ry
fdm_ky_xmjf
fdm_ky_zl_ry
fdm_ky_zlcg
fdm_ky_zz
fdm_ky_zz_ry
fdm_ryxx
fdm_swxx
fdm_ts_dzxx
fdm_ts_jyjl
fdm_ts_tsxx
fdm_xqxx
fdm_xs_jbxx
fdm_xs_jttxfsxx
fdm_xs_knxsxx
fdm_xs_lxrxx
fdm_xs_lyxx
fdm_xs_xjxx
fdm_xs_xjydxx
fdm_xs_xslyxx
fdm_xs_zcxx
fdm_xs_zsxx
fdm_ykt_jy
fdm_ykt_shxx
fdm_ykt_xx
'''
tables = tablesStr.split('\n')
for tabName in tables:
    sql = 'MSCK REPAIR TABLE fdm.' + tabName + ';'
    print(sql)
    hiveShell = """su hdfs -c \"hive -e \'""" + sql + """\'\" """
    status = os.system(hiveShell)
    #
    if status == 0:
        cnt_s = cnt_s + 1
        print(tabName, ' repaired successfully!')
    else:
        cnt_f = cnt_f + 1
        failList.append(tabName)
        print(tabName, ' repaired failed')
    print(cnt_s, ' success , ', cnt_f, ' fail')
if cnt_f != 0:
    print 'Repair failed: ', failList
print('finish--')
