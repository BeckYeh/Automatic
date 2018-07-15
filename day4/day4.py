#! /usr/bin/env python3
# -*- coding: utf-8 -*-
# Author BeckYeh

import sqlite3
import os
import time

if 'employee.db' not in os.listdir(os.path.dirname(os.path.abspath(__file__))):
    os.system('python3 {0}'.format(os.path.join(
        os.path.dirname(os.path.abspath(__file__)),
        'create_db.py')))
db = sqlite3.connect('employee.db')


def new_employee(name, age, phone, dept):
    db.execute('INSERT INTO employee (name, age, phone, dept, enroll_date) VALUES (?, ?, ?, ?, ?)',
               (name, age, phone, dept, time.strftime('%Y-%m-%d')))
    db.commit()


def del_employee(staff_id):
    db.execute('DELETE FROM employee WHERE staff_id = \"{0}\"'.format(staff_id) )
    db.commit()


def modify_employee(condition, condition_value, condition_value2):
    print('UPDATE employee SET {0} = \"{1}\" WHERE {2} = \"{3}\"'.format(condition, condition_value, condition, condition_value2))
    db.execute('UPDATE employee SET {0} = \"{1}\" WHERE {2} = \"{3}\"'.format(condition, condition_value, condition, condition_value2))
    db.commit()


def check_employee(condition, condition_value, compare):
    print('SELECT * FROM employee WHERE {0} {1} \"{2}\"'.format(condition, compare, condition_value))
    date = db.execute('SELECT * FROM employee WHERE {0} {1} \"{2}\"'.format(condition, compare, condition_value))
    row = date.fetchall()
    if len(row) > 0:
        for item in row:
            print('staff_id: ', item[0], '\t'
                  'name: ', item[1], '\t'
                  'age: ', item[2], '\t'
                  'phone', item[3], '\t'
                  'dept: ', item[4], '\t'
                  'date: ', item[5])
    elif len(row) == 0:
        print('未搜尋到相關紀錄')


compare = {
    '大於': '>',
    '小於': '<',
    '等於': '=',
    '包含': 'like'
}
table_name = ['', 'name', 'age', 'phone', 'dept', 'enroll_date']
compare2 = ['', '大於', '小於', '等於', '包含']

while True:
    print('Beck 的 爛員工加刪查 小程式'.center(50, '-'))
    do = input('請輸入您要進行的動作 A/a(dd) M/m(odify) C/c(heck) D/d(elete) Q/q(uit)：')
    if do == 'A' or do == 'a':
        user = input('請輸入要新增的員工姓名、年齡、手機號碼、部門，請使用空格分隔（例如：Alex 23 0953000000 IT）：').split()
        if user[1].isdigit() and user[2].isdigit() and len(user) == 4:
            new_employee(user[0], int(user[1]), user[2], user[3])
        else:
            print('輸入錯誤，請重新輸入')
    elif do == 'M' or do == 'm':
        condition = input('請選擇您要變更的項目:\n1. 姓名\n2. 年齡\n3. 電話號碼\n4. 部門\n請輸入項目編號: ')
        value1 = input('\n請輸入變更前的值 : ')
        value2 = input('\n請輸入變更後的值 : ')

        modify_employee(table_name[int(condition)], value2, value1)
    elif do == 'D' or do == 'd':
        user = input('請輸入員工 ID : ')
        del_employee(int(user))
    elif do == 'C' or do == 'c':
        condition = input('請您選擇要檢視的項目\n1. 姓名\n2. 年齡\n3. 電話號碼\n4. 部門\n5. 日期\n項目: ')
        value1 = input('請選擇判斷條件\n1. 大於\n2. 小於\n3. 等於\n4. 包含\n條件: ')
        value2 = input('請輸入值: ')
        if int(condition) == 2 or int(condition) == 3:
            value2 = int(value2)
        check_employee(table_name[int(condition)], value2, compare[compare2[int(value1)]])
    elif do == 'Q' or do == 'q':
        break
