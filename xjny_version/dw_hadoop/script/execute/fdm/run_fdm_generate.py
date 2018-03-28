# -*- coding:utf-8-*-
import sys
import os
sql = """
insert overwrite table fdm.edu_fdm_ccwzlxxx PARTITION (dt = '2017-08-11')  select * from bdm.edu_fdm_ccwzlxxx;
insert overwrite table fdm.edu_fdm_jlhdxx PARTITION (dt = '2017-08-11')  select * from bdm.edu_fdm_jlhdxx;
insert overwrite table fdm.edu_fdm_jxjxx PARTITION (dt = '2017-08-11') 
  select  * from bdm.edu_fdm_jxjxx;
insert overwrite table fdm.edu_fdm_jzg_jbxx PARTITION (dt = '2017-08-11') 
  select  * from bdm.edu_fdm_jzg_jbxx;
insert overwrite table fdm.edu_fdm_jzg_jxcgj PARTITION (dt = '2017-08-11') 
  select  * from bdm.edu_fdm_jzg_jxcgj;
  insert overwrite table fdm.edu_fdm_kc_cjjbxx PARTITION (dt = '2017-08-11') 
  select  *  from bdm.edu_fdm_kc_cjjbxx;
  insert overwrite table fdm.edu_fdm_kc_jbxx PARTITION (dt = '2017-08-11') 
  select *  from bdm.edu_fdm_kc_jbxx;
  insert overwrite table fdm.edu_fdm_kc_jspj PARTITION (dt = '2017-08-11') 
  select  * from bdm.edu_fdm_kc_jspj;
  insert overwrite table fdm.edu_fdm_kc_pk PARTITION (dt = '2017-08-11') 
  select  *        
  from bdm.edu_fdm_kc_pk;
  insert overwrite table fdm.edu_fdm_kc_xsxkxx PARTITION (dt = '2017-08-11') 
  select  *        
  from bdm.edu_fdm_kc_xsxkxx;
  insert overwrite table fdm.edu_fdm_kcqd PARTITION (dt = '2017-08-11') 
  select  *        
  from bdm.edu_fdm_kcqd;
  insert overwrite table fdm.edu_fdm_ky_cgj_ry PARTITION (dt = '2017-08-11')
  select * from bdm.edu_fdm_ky_cgj_ry;
  insert overwrite table fdm.edu_fdm_ky_lw PARTITION (dt = '2017-08-11')
  select * from bdm.edu_fdm_ky_lw;
  insert overwrite table fdm.edu_fdm_ky_lw_attr PARTITION (dt = '2017-08-11')
  select * from bdm.edu_fdm_ky_lw_attr;
  insert overwrite table fdm.edu_fdm_ky_lw_ry PARTITION (dt = '2017-08-11')
  select * from bdm.edu_fdm_ky_lw_ry;
  insert overwrite table fdm.edu_fdm_ky_lwfb PARTITION (dt = '2017-08-11')
  select * from bdm.edu_fdm_ky_lwfb;
  insert overwrite table fdm.edu_fdm_ky_xm PARTITION (dt = '2017-08-11')
  select * from bdm.edu_fdm_ky_xm;
  insert overwrite table fdm.edu_fdm_ky_xm_ry PARTITION (dt = '2017-08-11')
  select * from bdm.edu_fdm_ky_xm_ry;
  insert overwrite table fdm.edu_fdm_ky_xmjf PARTITION (dt = '2017-08-11')
  select * from bdm.edu_fdm_ky_xmjf;
  insert overwrite table fdm.edu_fdm_ky_zl_ry PARTITION (dt = '2017-08-11')
  select * from bdm.edu_fdm_ky_zl_ry;
  insert overwrite table fdm.edu_fdm_ky_zlcg PARTITION (dt = '2017-08-11')
  select * from bdm.edu_fdm_ky_zlcg;
  insert overwrite table fdm.edu_fdm_ky_zz PARTITION (dt = '2017-08-11')
  select * from bdm.edu_fdm_ky_zz;
  insert overwrite table fdm.edu_fdm_ky_zz_ry PARTITION (dt = '2017-08-11')
  select * from bdm.edu_fdm_ky_zz_ry;
  insert overwrite table fdm.EDU_FDM_RYXX PARTITION (dt = '2017-08-11')
  select * from bdm.EDU_FDM_RYXX;
  insert overwrite table fdm.EDU_FDM_SWXX PARTITION (dt = '2017-08-11')
  select * from bdm.EDU_FDM_SWXX;
  insert overwrite table fdm.edu_fdm_ts_dzxx PARTITION (dt = '2017-08-11')
  select * from bdm.edu_fdm_ts_dzxx;
  insert overwrite table fdm.edu_fdm_ts_jyjl PARTITION (dt = '2017-08-11')
  select * from bdm.edu_fdm_ts_jyjl;
  insert overwrite table fdm.edu_fdm_ts_tsxx PARTITION (dt = '2017-08-11')
  select * from bdm.edu_fdm_ts_tsxx;
  insert overwrite table fdm.EDU_FDM_XQXX PARTITION (dt = '2017-08-11')
  select * from bdm.EDU_FDM_XQXX;
  insert overwrite table fdm.EDU_FDM_XS_JBXX PARTITION (dt = '2017-08-11')
  select * from bdm.EDU_FDM_XS_JBXX;

  insert overwrite table fdm.EDU_FDM_XS_KNXSXX PARTITION (dt = '2017-08-11')
  select * from bdm.EDU_FDM_XS_KNXSXX;
  insert overwrite table fdm.EDU_FDM_XS_LXRXX PARTITION (dt = '2017-08-11')
  select * from bdm.EDU_FDM_XS_LXRXX;
  insert overwrite table fdm.EDU_FDM_XS_LYXX PARTITION (dt = '2017-08-11')
  select * from bdm.EDU_FDM_XS_LYXX;
  insert overwrite table fdm.EDU_FDM_XS_XJXX PARTITION (dt = '2017-08-11')
  select * from bdm.EDU_FDM_XS_XJXX;
  insert overwrite table fdm.EDU_FDM_XS_XJYDXX PARTITION (dt = '2017-08-11')
  select * from bdm.EDU_FDM_XS_XJYDXX;
  insert overwrite table fdm.EDU_FDM_XS_XSLYXX PARTITION (dt = '2017-08-11')
  select * from bdm.EDU_FDM_XS_XSLYXX;
  insert overwrite table fdm.EDU_FDM_XS_ZCXX PARTITION (dt = '2017-08-11')
  select * from bdm.EDU_FDM_XS_ZCXX;
  insert overwrite table fdm.EDU_FDM_XS_ZSXX PARTITION (dt = '2017-08-11')
  select * from bdm.EDU_FDM_XS_ZSXX;
  insert overwrite table fdm.EDU_FDM_YKT_JY PARTITION (dt = '2017-08-11')
  select * from bdm.EDU_FDM_YKT_JY;
  insert overwrite table fdm.EDU_FDM_YKT_SHXX PARTITION (dt = '2017-08-11')
  select * from bdm.EDU_FDM_YKT_SHXX;
  insert overwrite table fdm.edu_fdm_ykt_xx PARTITION (dt = '2017-08-11')
  select * from bdm.edu_fdm_ykt_xx;

"""
#hiveShell ='hive -e "'+sql+'"'
print(hiveShell)
#os.system(hiveShell)
print('finish--')