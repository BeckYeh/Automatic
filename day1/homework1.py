#! /usr/bin/env python3
# -*- coding: utf-8 -*-
# Author BeckYeh

import pickle
import os
import getpass
import platform
import time
import copy

if platform.system() == 'Windows':
    clear = 'cls'
else:
    clear = 'clear'

user = list()

if 'user_login.txt' in os.listdir():
    if os.path.getsize('user_login.txt') > 0:
        with open('user_login.txt', 'rb') as f:
            user_login = pickle.load(f)
            for i in user_login:
                user.append(i[0])
    else:
        user_login = list()
else:
    f = open('user_login.txt', 'w')
    f.close()
    user_login = list()

if 'other' not in user:
    user_login.append(['other', 'passwd', 0])
    user.append('other')

user_info = copy.deepcopy(user_login)

while True:
    print("------------------Beck 的 爛登入系統------------------")
    print("----------- (R)igester / (L)ogin / (Q)uit -----------")
    do = input('請輸入您要進行的動作 (R/L/Q) ：')

    if do == 'R' or do == 'r':
        username = input("請輸入您的帳號：")
        if username in user:
            user_login[user.index('other')][2] += 1
            if user_login[user.index('other')][2] >= 3:
                print('想 try 帳號? 門都沒有!')
                break
            else:
                print("帳號已經存在，請更換帳號或是進行登入")
                time.sleep(3)
                os.system(clear)
                continue
        else:
            passwd = getpass.getpass('請輸入您的密碼：')
            user_login.append([username, passwd, 0])
            user_info.append([username, passwd, 0])
            user.append(username)
            f = open('user_login.txt', 'wb')
            pickle.dump(user_info, f)
            f.close()
            os.system(clear)
            continue

    elif do == 'L' or do == 'l':
        username = input("請輸入您的帳號：")
        passwd = getpass.getpass('請輸入您的密碼：')
        if username not in user:
            print('帳號或密碼錯誤')
            username = 'other'
        elif user_login[user.index(username)][2] < 3:
            if passwd == user_login[user.index(username)][1] and username != 'other':
                print("登入成功，轉跳到其他系統")
                break
            else:
                print('帳號或密碼錯誤')
        user_login[user.index(username)][2] += 1
        if user_login[user.index('other')][2] == 3:
            print('想 try 帳號? 門都沒有!')
            break
        elif user_login[user.index(username)][2] >= 3:
            print('你失敗太多次了喔，禁止你登入')
            user_info[user.index(username)][2] == 3
            f = open('user_login.txt', 'wb')
            pickle.dump(user_info, f)
            f.close()
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
