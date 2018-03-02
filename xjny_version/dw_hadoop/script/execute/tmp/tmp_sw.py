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

from gdm.edu_gdm_swxx
--
insert overwrite table tmp.edu_tmp_sw partition(dt='""" + data_day_str + """',sd='00-02')
select xh, login_time, logout_time,
       coalesce(case when substr(login_time,12,8)>='00:00:00' and substr(login_time,12,8)<='02:00:00'
                          and substr(logout_time,12,8)>='00:00:00' and substr(logout_time,12,8)<='02:00:00'
                   then to_unix_timestamp(concat(substr(login_time,1,11),substr(logout_time,12,8))) - to_unix_timestamp(login_time) + 
                       floor((to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(login_time,1,11),'00:00:00')))/86400)*2*3600

                 when substr(login_time,12,8)>'02:00:00' and substr(logout_time,12,8)>'02:00:00' 
                   then 
                       floor((to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(login_time,1,11),'02:00:00')))/86400)*2*3600

                 when substr(login_time,12,8)>='00:00:00' and substr(login_time,12,8)<='02:00:00' and substr(logout_time,12,8)>'02:00:00'
                   then to_unix_timestamp(concat(substr(login_time,1,11),'02:00:00')) - to_unix_timestamp(login_time) +
                       floor((to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(login_time,1,11),'02:00:00')))/86400)*2*3600

                 when substr(login_time,12,8)>'02:00:00' and substr(logout_time,12,8)>='00:00:00' and substr(logout_time,12,8)<='02:00:00' 
                   then to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(logout_time,1,11),'00:00:00')) + 
                       floor((to_unix_timestamp(logout_time) - to_unix_timestamp(login_time))/86400)*2*3600
            end
            ,0)  
          AS sc, '00-02' as seg
where ((login_time<=concat(substr(logout_time,1,11),'00:00:00') and concat(substr(logout_time,1,11),'00:00:00')<=logout_time )
or (concat(substr(login_time,1,11),'00:00:00')<=login_time and login_time<=concat(substr(login_time,1,11),'02:00:00'))) and dt='""" + data_day_str + """'
-- 
insert overwrite table tmp.edu_tmp_sw partition(dt='""" + data_day_str + """',sd='02-04')
select xh, login_time, logout_time,
       coalesce(case when substr(login_time,12,8)>='02:00:00' and substr(login_time,12,8)<='04:00:00'
                         and substr(logout_time,12,8)>='02:00:00' and substr(logout_time,12,8)<='04:00:00'
                   then to_unix_timestamp(concat(substr(login_time,1,11),substr(logout_time,12,8))) - to_unix_timestamp(login_time) + 
                       floor((to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(login_time,1,11),'02:00:00')))/86400)*2*3600

                 when (substr(login_time,12,8)>'04:00:00' or substr(login_time,12,8)<'02:00:00')and (substr(logout_time,12,8)>'04:00:00' or substr(logout_time,12,8)<'02:00:00')
                   then 
                       case when substr(login_time,12,8)<'02:00:00'
                           then 2*3600+floor((to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(login_time,1,11),'04:00:00')))/86400)*2*3600
                           when substr(login_time,12,8)>'04:00:00'
                           then floor((to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(login_time,1,11),'04:00:00')))/86400)*2*3600
                           end

                 when (substr(login_time,12,8)>='02:00:00' and substr(login_time,12,8)<='04:00:00') 
                       and (substr(logout_time,12,8)>'04:00:00' or substr(logout_time,12,8)<'02:00:00')
                   then to_unix_timestamp(concat(substr(login_time,1,11),'04:00:00')) - to_unix_timestamp(login_time) +
                       floor((to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(login_time,1,11),'04:00:00')))/86400)*2*3600

                 when (substr(login_time,12,8)>'04:00:00' or substr(login_time,12,8)<'02:00:00')
                       and (substr(logout_time,12,8)>='02:00:00' and substr(logout_time,12,8)<='04:00:00') 
                   then to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(logout_time,1,11),'02:00:00')) + 
                       floor((to_unix_timestamp(logout_time) - to_unix_timestamp(login_time))/86400)*2*3600
            end
            ,0)  
          AS sc, '02-04' as seg
where ((login_time<=concat(substr(logout_time,1,11),'02:00:00') and concat(substr(logout_time,1,11),'02:00:00')<=logout_time )
or (concat(substr(login_time,1,11),'02:00:00')<=login_time and login_time<=concat(substr(login_time,1,11),'04:00:00'))) and dt='""" + data_day_str + """'
-- 
insert overwrite table tmp.edu_tmp_sw partition(dt='""" + data_day_str + """',sd='04-06')
select xh, login_time, logout_time,
       coalesce(case when substr(login_time,12,8)>='04:00:00' and substr(login_time,12,8)<='06:00:00' and substr(logout_time,12,8)>='04:00:00' and substr(logout_time,12,8)<='06:00:00'
                   then to_unix_timestamp(concat(substr(login_time,1,11),substr(logout_time,12,8))) - to_unix_timestamp(login_time) + 
                       floor((to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(login_time,1,11),'04:00:00')))/86400)*2*3600

                 when (substr(login_time,12,8)>'06:00:00' or substr(login_time,12,8)<'04:00:00')
                       and (substr(logout_time,12,8)>'06:00:00' or substr(logout_time,12,8)<'04:00:00')
                   then 
                       case when substr(login_time,12,8)<'04:00:00'
                           then 2*3600+floor((to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(login_time,1,11),'06:00:00')))/86400)*2*3600
                           when substr(login_time,12,8)>'06:00:00'
                           then floor((to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(login_time,1,11),'06:00:00')))/86400)*2*3600
                           end

                 when (substr(login_time,12,8)>='04:00:00' and substr(login_time,12,8)<='06:00:00') and (substr(logout_time,12,8)>'06:00:00' or substr(logout_time,12,8)<'04:00:00')
                   then to_unix_timestamp(concat(substr(login_time,1,11),'06:00:00')) - to_unix_timestamp(login_time) +
                       floor((to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(login_time,1,11),'06:00:00')))/86400)*2*3600

                 when (substr(login_time,12,8)>'06:00:00' or substr(login_time,12,8)<'04:00:00')and (substr(logout_time,12,8)>='04:00:00' and substr(logout_time,12,8)<='06:00:00') 
                   then to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(logout_time,1,11),'04:00:00')) + 
                       floor((to_unix_timestamp(logout_time) - to_unix_timestamp(login_time))/86400)*2*3600
            end
            ,0)  
          AS sc, '04-06' as seg
where ((login_time<=concat(substr(logout_time,1,11),'04:00:00') and concat(substr(logout_time,1,11),'04:00:00')<=logout_time )
or (concat(substr(login_time,1,11),'04:00:00')<=login_time and login_time<=concat(substr(login_time,1,11),'06:00:00'))) and dt='""" + data_day_str + """'
-- 
insert overwrite table tmp.edu_tmp_sw partition(dt='""" + data_day_str + """',sd='06-08')
select xh, login_time, logout_time,
       coalesce(case when substr(login_time,12,8)>='06:00:00' and substr(login_time,12,8)<='08:00:00' and substr(logout_time,12,8)>='06:00:00' and substr(logout_time,12,8)<='08:00:00'
                   then to_unix_timestamp(concat(substr(login_time,1,11),substr(logout_time,12,8))) - to_unix_timestamp(login_time) + 
                       floor((to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(login_time,1,11),'06:00:00')))/86400)*2*3600

                 when (substr(login_time,12,8)>'08:00:00' or substr(login_time,12,8)<'06:00:00')and (substr(logout_time,12,8)>'08:00:00' or substr(logout_time,12,8)<'06:00:00')
                   then 
                       case when substr(login_time,12,8)<'06:00:00'
                           then 2*3600+floor((to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(login_time,1,11),'08:00:00')))/86400)*2*3600
                           when substr(login_time,12,8)>'08:00:00'
                           then floor((to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(login_time,1,11),'08:00:00')))/86400)*2*3600
                           end

                 when (substr(login_time,12,8)>='06:00:00' and substr(login_time,12,8)<='08:00:00') and (substr(logout_time,12,8)>'08:00:00' or substr(logout_time,12,8)<'06:00:00')
                   then to_unix_timestamp(concat(substr(login_time,1,11),'08:00:00')) - to_unix_timestamp(login_time) +
                       floor((to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(login_time,1,11),'08:00:00')))/86400)*2*3600

                 when (substr(login_time,12,8)>'08:00:00' or substr(login_time,12,8)<'06:00:00')and (substr(logout_time,12,8)>='06:00:00' and substr(logout_time,12,8)<='08:00:00') 
                   then to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(logout_time,1,11),'06:00:00')) + 
                       floor((to_unix_timestamp(logout_time) - to_unix_timestamp(login_time))/86400)*2*3600
            end
            ,0)  
          AS sc, '06-08' as seg
where ((login_time<=concat(substr(logout_time,1,11),'06:00:00') and concat(substr(logout_time,1,11),'06:00:00')<=logout_time )
or (concat(substr(login_time,1,11),'06:00:00')<=login_time and login_time<=concat(substr(login_time,1,11),'08:00:00'))) and dt='""" + data_day_str + """'
--
insert overwrite table tmp.edu_tmp_sw partition(dt='""" + data_day_str + """',sd='08-10')
select xh, login_time, logout_time,
       coalesce(case when substr(login_time,12,8)>='08:00:00' and substr(login_time,12,8)<='10:00:00' and substr(logout_time,12,8)>='08:00:00' and substr(logout_time,12,8)<='10:00:00'
                   then to_unix_timestamp(concat(substr(login_time,1,11),substr(logout_time,12,8))) - to_unix_timestamp(login_time) + 
                       floor((to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(login_time,1,11),'08:00:00')))/86400)*2*3600

                 when (substr(login_time,12,8)>'10:00:00' or substr(login_time,12,8)<'08:00:00')and (substr(logout_time,12,8)>'10:00:00' or substr(logout_time,12,8)<'08:00:00')
                   then 
                       case when substr(login_time,12,8)<'08:00:00'
                           then 2*3600+floor((to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(login_time,1,11),'10:00:00')))/86400)*2*3600
                           when substr(login_time,12,8)>'10:00:00'
                           then floor((to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(login_time,1,11),'10:00:00')))/86400)*2*3600
                           end

                 when (substr(login_time,12,8)>='08:00:00' and substr(login_time,12,8)<='10:00:00') and (substr(logout_time,12,8)>'10:00:00' or substr(logout_time,12,8)<'08:00:00')
                   then to_unix_timestamp(concat(substr(login_time,1,11),'10:00:00')) - to_unix_timestamp(login_time) +
                       floor((to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(login_time,1,11),'10:00:00')))/86400)*2*3600

                 when (substr(login_time,12,8)>'10:00:00' or substr(login_time,12,8)<'08:00:00')and (substr(logout_time,12,8)>='08:00:00' and substr(logout_time,12,8)<='10:00:00') 
                   then to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(logout_time,1,11),'08:00:00')) + 
                       floor((to_unix_timestamp(logout_time) - to_unix_timestamp(login_time))/86400)*2*3600
            end
            ,0)  
          AS sc, '08-10' as seg
where ((login_time<=concat(substr(logout_time,1,11),'08:00:00') and concat(substr(logout_time,1,11),'08:00:00')<=logout_time )
or (concat(substr(login_time,1,11),'08:00:00')<=login_time and login_time<=concat(substr(login_time,1,11),'10:00:00'))) and dt='""" + data_day_str + """'
-- 

insert overwrite table tmp.edu_tmp_sw partition(dt='""" + data_day_str + """',sd='10-12')
select xh, login_time, logout_time,
       coalesce(case when substr(login_time,12,8)>='10:00:00' and substr(login_time,12,8)<='12:00:00' and substr(logout_time,12,8)>='10:00:00' and substr(logout_time,12,8)<='12:00:00'
                   then to_unix_timestamp(concat(substr(login_time,1,11),substr(logout_time,12,8))) - to_unix_timestamp(login_time) + 
                       floor((to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(login_time,1,11),'10:00:00')))/86400)*2*3600

                 when (substr(login_time,12,8)>'12:00:00' or substr(login_time,12,8)<'10:00:00')and (substr(logout_time,12,8)>'12:00:00' or substr(logout_time,12,8)<'10:00:00')
                   then 
                       case when substr(login_time,12,8)<'10:00:00'
                           then 2*3600+floor((to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(login_time,1,11),'12:00:00')))/86400)*2*3600
                           when substr(login_time,12,8)>'12:00:00'
                           then floor((to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(login_time,1,11),'12:00:00')))/86400)*2*3600
                           end

                 when (substr(login_time,12,8)>='10:00:00' and substr(login_time,12,8)<='12:00:00') and (substr(logout_time,12,8)>'12:00:00' or substr(logout_time,12,8)<'10:00:00')
                   then to_unix_timestamp(concat(substr(login_time,1,11),'12:00:00')) - to_unix_timestamp(login_time) +
                       floor((to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(login_time,1,11),'12:00:00')))/86400)*2*3600

                 when (substr(login_time,12,8)>'12:00:00' or substr(login_time,12,8)<'10:00:00')and (substr(logout_time,12,8)>='10:00:00' and substr(logout_time,12,8)<='12:00:00') 
                   then to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(logout_time,1,11),'10:00:00')) + 
                       floor((to_unix_timestamp(logout_time) - to_unix_timestamp(login_time))/86400)*2*3600
            end
            ,0)  
          AS sc, '10-12' as seg
where ((login_time<=concat(substr(logout_time,1,11),'10:00:00') and concat(substr(logout_time,1,11),'10:00:00')<=logout_time )
or (concat(substr(login_time,1,11),'10:00:00')<=login_time and login_time<=concat(substr(login_time,1,11),'12:00:00'))) and dt='""" + data_day_str + """'
-- 
insert overwrite table tmp.edu_tmp_sw partition(dt='""" + data_day_str + """',sd='12-14')
select xh, login_time, logout_time,
       coalesce(case when substr(login_time,12,8)>='12:00:00' and substr(login_time,12,8)<='14:00:00' and substr(logout_time,12,8)>='12:00:00' and substr(logout_time,12,8)<='14:00:00'
                   then to_unix_timestamp(concat(substr(login_time,1,11),substr(logout_time,12,8))) - to_unix_timestamp(login_time) + 
                       floor((to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(login_time,1,11),'12:00:00')))/86400)*2*3600

                 when (substr(login_time,12,8)>'14:00:00' or substr(login_time,12,8)<'12:00:00')and (substr(logout_time,12,8)>'14:00:00' or substr(logout_time,12,8)<'12:00:00')
                   then 
                       case when substr(login_time,12,8)<'12:00:00'
                           then 2*3600+floor((to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(login_time,1,11),'14:00:00')))/86400)*2*3600
                           when substr(login_time,12,8)>'14:00:00'
                           then floor((to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(login_time,1,11),'14:00:00')))/86400)*2*3600
                           end

                 when (substr(login_time,12,8)>='12:00:00' and substr(login_time,12,8)<='14:00:00') and (substr(logout_time,12,8)>'14:00:00' or substr(logout_time,12,8)<'12:00:00')
                   then to_unix_timestamp(concat(substr(login_time,1,11),'14:00:00')) - to_unix_timestamp(login_time) +
                       floor((to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(login_time,1,11),'14:00:00')))/86400)*2*3600

                 when (substr(login_time,12,8)>'14:00:00' or substr(login_time,12,8)<'12:00:00')and (substr(logout_time,12,8)>='12:00:00' and substr(logout_time,12,8)<='14:00:00') 
                   then to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(logout_time,1,11),'12:00:00')) + 
                       floor((to_unix_timestamp(logout_time) - to_unix_timestamp(login_time))/86400)*2*3600
            end
            ,0)  
          AS sc, '12-14' as seg
where ((login_time<=concat(substr(logout_time,1,11),'12:00:00') and concat(substr(logout_time,1,11),'12:00:00')<=logout_time )
or (concat(substr(login_time,1,11),'12:00:00')<=login_time and login_time<=concat(substr(login_time,1,11),'14:00:00'))) and dt='""" + data_day_str + """'
-- 
insert overwrite table tmp.edu_tmp_sw partition(dt='""" + data_day_str + """',sd='14-16')
select xh, login_time, logout_time,
       coalesce(case when substr(login_time,12,8)>='14:00:00' and substr(login_time,12,8)<='16:00:00' and substr(logout_time,12,8)>='14:00:00' and substr(logout_time,12,8)<='16:00:00'
                   then to_unix_timestamp(concat(substr(login_time,1,11),substr(logout_time,12,8))) - to_unix_timestamp(login_time) + 
                       floor((to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(login_time,1,11),'14:00:00')))/86400)*2*3600

                 when (substr(login_time,12,8)>'16:00:00' or substr(login_time,12,8)<'14:00:00')and (substr(logout_time,12,8)>'16:00:00' or substr(logout_time,12,8)<'14:00:00')
                   then 
                       case when substr(login_time,12,8)<'14:00:00'
                           then 2*3600+floor((to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(login_time,1,11),'16:00:00')))/86400)*2*3600
                           when substr(login_time,12,8)>'16:00:00'
                           then floor((to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(login_time,1,11),'16:00:00')))/86400)*2*3600
                           end

                 when (substr(login_time,12,8)>='14:00:00' and substr(login_time,12,8)<='16:00:00') and (substr(logout_time,12,8)>'16:00:00' or substr(logout_time,12,8)<'14:00:00')
                   then to_unix_timestamp(concat(substr(login_time,1,11),'16:00:00')) - to_unix_timestamp(login_time) +
                       floor((to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(login_time,1,11),'16:00:00')))/86400)*2*3600

                 when (substr(login_time,12,8)>'16:00:00' or substr(login_time,12,8)<'14:00:00')and (substr(logout_time,12,8)>='14:00:00' and substr(logout_time,12,8)<='16:00:00') 
                   then to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(logout_time,1,11),'14:00:00')) + 
                       floor((to_unix_timestamp(logout_time) - to_unix_timestamp(login_time))/86400)*2*3600
            end
            ,0)  
          AS sc, '14-16' as seg
where ((login_time<=concat(substr(logout_time,1,11),'14:00:00') and concat(substr(logout_time,1,11),'14:00:00')<=logout_time )
or (concat(substr(login_time,1,11),'14:00:00')<=login_time and login_time<=concat(substr(login_time,1,11),'16:00:00'))) and dt='""" + data_day_str + """'
--
insert overwrite table tmp.edu_tmp_sw partition(dt='""" + data_day_str + """',sd='16-18')
select xh, login_time, logout_time,
       coalesce(case when substr(login_time,12,8)>='16:00:00' and substr(login_time,12,8)<='18:00:00' and substr(logout_time,12,8)>='16:00:00' and substr(logout_time,12,8)<='18:00:00'
                   then to_unix_timestamp(concat(substr(login_time,1,11),substr(logout_time,12,8))) - to_unix_timestamp(login_time) + 
                       floor((to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(login_time,1,11),'16:00:00')))/86400)*2*3600

                 when (substr(login_time,12,8)>'18:00:00' or substr(login_time,12,8)<'16:00:00')and (substr(logout_time,12,8)>'18:00:00' or substr(logout_time,12,8)<'16:00:00')
                   then 
                       case when substr(login_time,12,8)<'16:00:00'
                           then 2*3600+floor((to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(login_time,1,11),'18:00:00')))/86400)*2*3600
                           when substr(login_time,12,8)>'18:00:00'
                           then floor((to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(login_time,1,11),'18:00:00')))/86400)*2*3600
                           end

                 when (substr(login_time,12,8)>='16:00:00' and substr(login_time,12,8)<='18:00:00') and (substr(logout_time,12,8)>'18:00:00' or substr(logout_time,12,8)<'16:00:00')
                   then to_unix_timestamp(concat(substr(login_time,1,11),'18:00:00')) - to_unix_timestamp(login_time) +
                       floor((to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(login_time,1,11),'18:00:00')))/86400)*2*3600

                 when (substr(login_time,12,8)>'18:00:00' or substr(login_time,12,8)<'16:00:00')and (substr(logout_time,12,8)>='16:00:00' and substr(logout_time,12,8)<='18:00:00') 
                   then to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(logout_time,1,11),'16:00:00')) + 
                       floor((to_unix_timestamp(logout_time) - to_unix_timestamp(login_time))/86400)*2*3600
            end
            ,0)  
          AS sc, '16-18' as seg
where ((login_time<=concat(substr(logout_time,1,11),'16:00:00') and concat(substr(logout_time,1,11),'16:00:00')<=logout_time )
or (concat(substr(login_time,1,11),'16:00:00')<=login_time and login_time<=concat(substr(login_time,1,11),'18:00:00'))) and dt='""" + data_day_str + """'
-- 
insert overwrite table tmp.edu_tmp_sw partition(dt='""" + data_day_str + """',sd='18-20')
select xh, login_time, logout_time,
       coalesce(case when substr(login_time,12,8)>='18:00:00' and substr(login_time,12,8)<='20:00:00' and substr(logout_time,12,8)>='18:00:00' and substr(logout_time,12,8)<='20:00:00'
                   then to_unix_timestamp(concat(substr(login_time,1,11),substr(logout_time,12,8))) - to_unix_timestamp(login_time) + 
                       floor((to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(login_time,1,11),'18:00:00')))/86400)*2*3600

                 when (substr(login_time,12,8)>'20:00:00' or substr(login_time,12,8)<'18:00:00')and (substr(logout_time,12,8)>'20:00:00' or substr(logout_time,12,8)<'18:00:00')
                   then 
                       case when substr(login_time,12,8)<'18:00:00'
                           then 2*3600+floor((to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(login_time,1,11),'20:00:00')))/86400)*2*3600
                           when substr(login_time,12,8)>'20:00:00'
                           then floor((to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(login_time,1,11),'20:00:00')))/86400)*2*3600
                           end

                 when (substr(login_time,12,8)>='18:00:00' and substr(login_time,12,8)<='20:00:00') and (substr(logout_time,12,8)>'20:00:00' or substr(logout_time,12,8)<'18:00:00')
                   then to_unix_timestamp(concat(substr(login_time,1,11),'20:00:00')) - to_unix_timestamp(login_time) +
                       floor((to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(login_time,1,11),'20:00:00')))/86400)*2*3600

                 when (substr(login_time,12,8)>'20:00:00' or substr(login_time,12,8)<'18:00:00')and (substr(logout_time,12,8)>='18:00:00' and substr(logout_time,12,8)<='20:00:00') 
                   then to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(logout_time,1,11),'18:00:00')) + 
                       floor((to_unix_timestamp(logout_time) - to_unix_timestamp(login_time))/86400)*2*3600
            end
            ,0)  
          AS sc, '18-20' as seg
where ((login_time<=concat(substr(logout_time,1,11),'18:00:00') and concat(substr(logout_time,1,11),'18:00:00')<=logout_time )
or (concat(substr(login_time,1,11),'18:00:00')<=login_time and login_time<=concat(substr(login_time,1,11),'20:00:00'))) and dt='""" + data_day_str + """'
-- 
insert overwrite table tmp.edu_tmp_sw partition(dt='""" + data_day_str + """',sd='20-22')
select xh, login_time, logout_time,
       coalesce(case when substr(login_time,12,8)>='20:00:00' and substr(login_time,12,8)<='22:00:00' and substr(logout_time,12,8)>='20:00:00' and substr(logout_time,12,8)<='22:00:00'
                   then to_unix_timestamp(concat(substr(login_time,1,11),substr(logout_time,12,8))) - to_unix_timestamp(login_time) + 
                       floor((to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(login_time,1,11),'20:00:00')))/86400)*2*3600

                 when (substr(login_time,12,8)>'22:00:00' or substr(login_time,12,8)<'20:00:00')and (substr(logout_time,12,8)>'22:00:00' or substr(logout_time,12,8)<'20:00:00')
                   then 
                       case when substr(login_time,12,8)<'20:00:00'
                           then 2*3600+floor((to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(login_time,1,11),'22:00:00')))/86400)*2*3600
                           when substr(login_time,12,8)>'22:00:00'
                           then floor((to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(login_time,1,11),'22:00:00')))/86400)*2*3600
                           end

                 when (substr(login_time,12,8)>='20:00:00' and substr(login_time,12,8)<='22:00:00') and (substr(logout_time,12,8)>'22:00:00' or substr(logout_time,12,8)<'20:00:00')
                   then to_unix_timestamp(concat(substr(login_time,1,11),'22:00:00')) - to_unix_timestamp(login_time) +
                       floor((to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(login_time,1,11),'22:00:00')))/86400)*2*3600

                 when (substr(login_time,12,8)>'22:00:00' or substr(login_time,12,8)<'20:00:00')and (substr(logout_time,12,8)>='20:00:00' and substr(logout_time,12,8)<='22:00:00') 
                   then to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(logout_time,1,11),'20:00:00')) + 
                       floor((to_unix_timestamp(logout_time) - to_unix_timestamp(login_time))/86400)*2*3600
            end
            ,0)  
          AS sc, '20-22' as seg
where ((login_time<=concat(substr(logout_time,1,11),'20:00:00') and concat(substr(logout_time,1,11),'20:00:00')<=logout_time )
or (concat(substr(login_time,1,11),'20:00:00')<=login_time and login_time<=concat(substr(login_time,1,11),'22:00:00'))) and dt='""" + data_day_str + """'
-- 
insert overwrite table tmp.edu_tmp_sw partition(dt='""" + data_day_str + """',sd='22-24')
select xh, login_time, logout_time,
       coalesce(case when substr(login_time,12,8)>='22:00:00' and substr(logout_time,12,8)>='22:00:00'
                   then to_unix_timestamp(concat(substr(login_time,1,11),substr(logout_time,12,8))) - to_unix_timestamp(login_time) + 
                       floor((to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(login_time,1,11),'22:00:00')))/86400)*2*3600

                 when substr(login_time,12,8)<'22:00:00' and substr(logout_time,12,8)<'22:00:00'
                   then 
                       floor((to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(login_time,1,11),'00:00:00')))/86400)*2*3600

                 when substr(login_time,12,8)>='22:00:00' and substr(logout_time,12,8)<'22:00:00'
                   then to_unix_timestamp(concat(substr(login_time,1,11),'24:00:00')) - to_unix_timestamp(login_time) + 
                       floor((to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(login_time,1,11),'24:00:00')))/86400)*2*3600

                 when substr(login_time,12,8)<'22:00:00'and substr(logout_time,12,8)>='22:00:00'
                   then to_unix_timestamp(logout_time) - to_unix_timestamp(concat(substr(logout_time,1,11),'22:00:00')) + 
                       floor((to_unix_timestamp(logout_time) - to_unix_timestamp(login_time))/86400)*2*3600
            end
            ,0)  
          AS sc, '22-24' as seg
where ((login_time<=concat(substr(logout_time,1,11),'22:00:00') and concat(substr(logout_time,1,11),'22:00:00')<=logout_time )
or (concat(substr(login_time,1,11),'22:00:00')<=login_time and login_time<=concat(substr(login_time,1,11),'24:00:00'))) and dt='""" + data_day_str + """';
"""
hiveShell = """su hdfs -c \"hive -e \'""" + sql + """\'\""""
print(hiveShell)
os.system(hiveShell)
print('finish--')
