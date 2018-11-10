#! /usr/bin/env python3
# -*- coding: utf-8 -*-
# Author BeckYeh

import sys
import os
import pickle

basedir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.append(basedir)

import conf.setting
import lib.role
import lib.log

school = dict()
admin = dict()

def instance_restore(path, role):
    pass

# 程序開始載入資料
# 載入 admin
if len(os.listdir(conf.setting.ADMIN_DB_DIR)) == 0:
    pass
else:
    for admin_file in os.listdir(conf.setting.ADMIN_DB_DIR):
        with open(os.path.join(conf.setting.ADMIN_DB_DIR, admin_file), 'w') as f:
            data = pickle.load(f)
            admin[admin_file] = lib.role.Admin(data['Username'], data['Password'])

# 載入 school
for school_file in os.listdir(conf.setting.SCHOOL_DB_DIR):





# 使用者驗證
