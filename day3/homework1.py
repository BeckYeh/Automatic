#! /usr/bin/env python3
# -*- coding: utf-8 -*-
# Author BeckYeh

import os, platform, time

if platform.system() == 'Windows':
    clear = 'cls'

def price_check(user):
    with open('info.txt', 'r') as f:
        for line in f:
            if user in line:
                line = line.split()
                print('{name}的工資是：{price}'.format(name=line[0], price=line[1]))

def price_modify(user):
    with open('info.txt', 'r') as f:
        data = str()
        for line in f:
            if user.split()[0] in line:
                line = user+'\n'
            data += line
    if user in data:
        with open('info.txt', 'w') as f:
            f.write(data)
        print('修改成功')
    else:
        print('無此用戶')

def price_add(user):
    userexist = False
    userinfo = user.split()
    with open('info.txt', 'r') as f:
        for line in f:
            if userinfo[0] in line:
                userexist = True

    if userexist:
        print('使用者已經存在')
    else:
        user = user + '\n'
        with open('info.txt', 'a') as f:
            f.write(user)
        print('增加用戶成功')

while True:
    print('Beck 的 爛員工加刪查 小程式'.center(50, '-'))
    do = input('請輸入您要進行的動作 A/a(dd) M/m(odify) C/c(heck) Q/q(uit)：')
    if do == 'A' or do == 'a':
        user = input('請輸入要修改的員工姓名和工資，用空格分隔（例如：Alex 10）：')
        if ' 'in user:
            if user.split()[1].isdigit():
                price_add(user)
                time.sleep(2)
                os.system(clear)
                continue

        print('輸入的數值有誤')
        time.sleep(2)
        os.system(clear)
    elif do == 'M' or do == 'm':
        user = input('請輸入要修改的員工姓名和工資，用空格分隔（例如：Alex 10）：')
        if ' ' in user:
            if user.split()[1].isdigit():
                price_modify(user)
                time.sleep(2)
                os.system(clear)
                continue

        print('輸入的數值有誤')
        time.sleep(2)
        os.system(clear)
    elif do == 'C' or do == 'c':
        user = input('請輸入要查詢的員工姓名（例如：Alex）：')
        price_check(user)
        time.sleep(2)
        os.system(clear)
    elif do == 'Q' or do == 'q':
        break
    else:
        print('你到底要幹啥?')
        time.sleep(2)
        os.system(clear)