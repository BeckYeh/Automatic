#! /usr/bin/env python3
# -*- coding: utf-8 -*-
# Author BeckYeh

import pickle
import os
import getpass
import platform
import time
from color import *

if platform.system() == 'Windows':
    clear = 'cls'
else:
    clear = 'clear'

user = str()

if 'user_login.txt' in os.listdir():
    if os.path.getsize('user_login.txt') > 0:
        with open('user_login.txt', 'rb') as f:
            user_login = pickle.load(f)
    else:
        user_login = dict()
else:
    f = open('user_login.txt', 'w')
    f.close()
    user_login = dict()

user_login['other'] = ['passwd', 0, 0, 0, []]

while True:
    print("------------------Beck 的 爛登入系統------------------")
    print("----------- (R)igester / (L)ogin / (Q)uit -----------")
    do = input('請輸入您要進行的動作 (R/L/Q) ：')

    if do == 'R' or do == 'r':
        username = input("請輸入您的帳號：")
        if username in user_login:
            user_login['other'][2] += 1
            if user_login['other'][2] >= 3:
                print('想 try 帳號? 門都沒有!')
                break
            else:
                print("帳號已經存在，請更換帳號或是進行登入")
                time.sleep(3)
                os.system(clear)
                continue
        else:
            passwd = getpass.getpass('請輸入您的密碼：')
            user_login[username] = [passwd, 1, 0, 0, []]
            print('註冊成功!')
            time.sleep(3)
            os.system(clear)
            continue

    elif do == 'L' or do == 'l':
        username = input("請輸入您的帳號：")
        passwd = getpass.getpass('請輸入您的密碼：')
        if username not in user_login:
            print('帳號或密碼錯誤')
            username = 'other'
        elif user_login[username][2] < 3:
            if passwd == user_login[username][0] and username != 'other':
                print("登入成功，轉跳到購物系統")
                user = username
                time.sleep(1)
                os.system(clear)
                break
            else:
                print('帳號或密碼錯誤')
        user_login[username][2] += 1
        if user_login['other'][2] == 3:
            print('想 try 帳號? 門都沒有!')
            break
        elif user_login[username][2] >= 3:
            print('你失敗太多次了喔，禁止你登入')
            break
        else:
            time.sleep(3)
            os.system(clear)
            continue

    elif do == 'Q' or do == 'q':
        break

    else:
        print('你到底想幹嗎呢? 重新再來一次')
        time.sleep(3)
        os.system(clear)
        continue

shop = False

if user != '':
    if 'product_info.txt' in os.listdir():
        if os.path.getsize('product_info.txt') > 0:
            with open('product_info.txt', 'rb') as f:
                product_info = pickle.load(f)
            shop = True
        else:
            printRed('目前尚未有販售商品，請管理員盡速添加')
            shop = False
    else:
        printRed('目前尚未有販售商品，請管理員盡速添加')
        shop = False

car = list()

while shop:
    print('Beck 的 購物系統'.center(40, '-'))
    if user_login[user][1]:
        money = input('請輸入您的工資：')
        if money.isdigit():
            user_login[user][3] = int(money)
            user_login[user][1] = 0
        else:
            print('不要亂輸入阿')
            time.sleep(3)
            os.system(clear)
            continue
    else:
        print('{} 您好!'.format(user))
        printYellow('您目前的餘額：{0}'.format(user_login[user][3]))
        print('目前可購買的商品如下：\n{0}'.format(
            '    '.join('{0}. {1} 價格:{2}'.format(x[0], x[1][0], x[1][1]) for x in list(enumerate(product_info)))))
        do = input('請輸入代碼購買商品 或是輸入 (C/c)heck 檢視過去購買的商品 (Q/q)uit ：')

        if do.isdigit():
            if int(do) < len(product_info):
                if product_info[int(do)][1] <= user_login[user][3]:
                    printRed('本次購買共 {0} 元'.format(product_info[int(do)][1]))
                    confirm = input('請問您是否確認要購買? (Y/N)：')
                    if confirm == 'Y' or confirm == 'y':
                        user_login[user][3] -= product_info[int(do)][1]
                        printRed('您剩餘的金額：{0}'.format(user_login[user][3]))
                        car.append(int(do))
                        time.sleep(3)
                        os.system(clear)
                        continue
                    else:
                        printRed('尚未完成購買')
                        time.sleep(3)
                        os.system(clear)
                        continue
                else:
                    printRed('您的餘額不足，少了 {} 元'.format((product_info[int(do)][1] - user_login[user][3])))
                    time.sleep(3)
                    os.system(clear)
                continue
        elif do == 'C' or do == 'c':
            printGreen('您的購買紀錄\n{0}'.format(
                '\n'.join('第{0}次購買:{1}'.format(x[0] + 1, x[1]) for x in list(enumerate(user_login[user][4])))))
            time.sleep(3)
            os.system(clear)
            continue

        elif do == 'Q' or do == 'q':
            printBlue('本次購買了 {0}'.format('  '.join('{0}:{1}'.format(x[0]+1, product_info[x[1]][0]) for x in list(enumerate(car)))))
            printRed('您目前的餘額：{0}'.format(user_login[user][3]))
            list1 = list()
            for i in car:
                list1.append(product_info[i][0])
            user_login[user][4].append(list1)
            break

for i in user_login:
    if user_login[i][2] < 3:
        user_login[i][2] = 0

f = open('user_login.txt', 'wb')
pickle.dump(user_login, f)
f.close()
