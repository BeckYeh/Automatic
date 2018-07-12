#! /usr/bin/env python3
# -*- coding: utf-8 -*-
# Author BeckYeh

import os
import time
import platform
from color import  *
import pickle

if platform.system() == 'Windows':
    clear = 'cls'

if 'product_info.txt' in os.listdir():
    if os.path.getsize('product_info.txt') > 0:
        with open('product_info.txt', 'rb') as f:
            product_info = pickle.load(f)
    else:
        product_info = list()
else:
    f = open('product_info.txt', 'w')
    f.close()
    product_info = list()

while True:
    if len(product_info) == 0:
        print('目前沒有任何商品，請您立即添加第一件商品')
        product_name = input('請輸入商品名稱：')
        price = input('請輸入價格：')
        if price.isdigit():
            product_info.append([product_name, int(price)])
            print('商品添加成功!')
        else:
            print('商品添加失敗，請輸入正確的價格')
        time.sleep(1)
        os.system(clear)
        continue
    else:
        print('Beck 的 爛商品管理系統'.center(20,'-'))
        print('您目前的商品如下：\n{0}'.format('    '.join('{0}. {1} 價格:{2}'.format(x[0], x[1][0], x[1][1]) for x in list(enumerate(product_info)) )))
        do = input('請輸入您要進行的動作 (A/a)dd 增加商品  (D/d)elete 刪除商品  (Q/q)uit 或直接輸入商品代碼修改價格：')
        if do == 'A' or do == 'a':
            product_name = input('請輸入商品名稱：')
            for i in product_info:
                if i[0] == product_name:
                    printRed('商品已經存在!')
                    time.sleep(1)
                    os.system(clear)
                    continue
            price = input('請輸入價格：')
            if price.isdigit():
                product_info.append([product_name, int(price)])
                printRed('商品添加成功!')
            else:
                print('商品添加失敗，請輸入正確的價格')
            time.sleep(1)
            os.system(clear)
            continue
        elif do == 'D' or do == 'd':
            act = input('請輸入您要刪除的商品代碼：')
            if act.isdigit():
                if int(act) < len(product_info):
                    confirm = input('請確認您要刪除的商品是否為 {0} (Y/N)：'.format(product_info[int(act)][0]))
                    if confirm == 'Y' or 'y':
                        del product_info[int(act)]
                        printRed('刪除成功!')
                        time.sleep(1)
                        os.system(clear)
                        continue
                    else:
                        printRed('刪除失敗')
                        time.sleep(1)
                        os.system(clear)
                        continue
                else:
                    print('代碼輸入錯誤')
            else:
                print('代碼輸入錯誤')
            time.sleep(1)
            os.system(clear)
        elif do.isdigit():
            if int(do) < len(product_info):
                print('商品:{0} 目前的價格是:'.format(product_info[int(do)][0]), end='')
                printYellow('{0}'.format(product_info[int(do)][1]))
                price = input('請輸入新的價格：')
                if price.isdigit():
                    product_info[int(do)][1] = price
                    print('商品價格修改成功!')
                else:
                    print('商品添加失敗，請輸入正確的價格')
                time.sleep(1)
                os.system(clear)
                continue
            else:
                print('代碼輸入錯誤')
                time.sleep(1)
                os.system(clear)
        elif do == 'Q' or do =='q':
            print('退出系統!')
            time.sleep(1)
            break
        else:
            printRed('你到底想幹啥?')
            time.sleep(1)
            os.system(clear)

f = open('product_info.txt', 'wb')
pickle.dump(product_info, f)
f.close()