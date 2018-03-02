#! /usr/bin/env python
#-*- coding:UTF-8 -*-
#===============================================================================
#         FILE: app_ads_gdt_click_orders_15days_v2.py
#
#        USAGE: ./app_ads_gdt_click_orders_15days_v2.py
#
#  DESCRIPTION:
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: lizhanlei@jd.com
#      COMPANY: bigdata.h3c.com
#      VERSION: 1.0
#      CREATED: 2018/2/11
#     REVIEWER:
#     REVISION: ---
#    SRC_TABLE:
#    TGT_TABLE:
#===============================================================================

#9,10,11,12,1 第一学期;2，3，4，5，6，7 第二学期
# 其中8月份放假，暂且放入第一学期。因为大部分学校都选在8月底开学
import datetime
def getXNandXQ():
    now=datetime.datetime.now()
    year=int(now.strftime("%Y"))
    month=int(now.strftime("%m"))
    if month>=2 and month<8:
        xn="%d-%d"%(year-1,year)
        xq=2

    elif month>=8:
        xn="%d-%d"%(year,year+1)
        xq=1

    else:
        xn="%d-%d"%(year-1,year)
        xq=1
    return str(xn), str(xq)


def getXNandXQByYM(year,month):
    if month>=2 and month<8:
        xn="%d-%d"%(year-1,year)
        xq=2
    elif month>=8:
        xn="%d-%d"%(year,year+1)
        xq=1
    else:
        xn="%d-%d"%(year-1,year)
        xq=1
    return str(xn), str(xq)

def getXNandXQByStr12(date_str):
    year = int(date_str[0:4])
    month = int(date_str[5:7])
    if month>=2 and month<8:
        xn="%d-%d"%(year-1,year)
        xq=2

    elif month>=8:
        xn="%d-%d"%(year,year+1)
        xq=1

    else:
        xn="%d-%d"%(year-1,year)
        xq=1
    return str(xn),str(xq)