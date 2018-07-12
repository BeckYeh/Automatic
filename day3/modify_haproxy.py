#! /usr/bin/env python3
# -*- coding: utf-8 -*-
# Author BeckYeh

import os, platform, time

if platform.system() == 'Windows':
    clear = 'cls'

def proxy_add(**info):
    data = str()
    with open('HAProxy.cfg', 'r') as f:
        for line in f:
            data += line
            if info['backend'] in line:
                data += '        server {server} weight {weight} maxconn {maxconn}\n'.format(server=info['record']['server'],
                                                                                             weight=info['record']['weight'],
                                                                                             maxconn=info['record']['maxconn'])

        if info['backend'] not in data:
            data += '\nbackend {backend}\n'.format(backend=info['backend'])
            data += '        server {server} weight {weight} maxconn {maxconn}\n'.format(server=info['record']['server'],
                                                                                         weight=info['record']['weight'],
                                                                                         maxconn=info['record']['maxconn'])
    with open('HAProxy.cfg', 'w') as f:
        f.write(data)
    print('動作完成')

def proxy_del(**info):
    data = str()
    with open('HAProxy.cfg', 'r') as f:
        for line in f:
            if info['record']['server'] in line and str(info['record']['weight']) in line and str(info['record']['maxconn']) in line:
                if data.count('backend') > 0:
                    if info['backend'] in data[data.rindex('backend'):] and 'if' not in data[data.rindex('backend'):]:
                        continue
            elif 'backend' in line and data.count('backend') > 0:
                if 'server' not in data[data.rindex('backend'):] and 'if' not in data[data.rindex('backend'):]:
                    data = data[:data.rindex('backend')]
            data += line

    with open('HAProxy.cfg', 'w') as f:
        f.write(data)
    print('動作完成')

def proxy_chk(info):
    data = str()
    add = False
    with open('HAProxy.cfg', 'r') as f:
        last = f.readlines()[-1]
        f.seek(0)
        for line in f:
            if info in line and 'backend' in line and 'use' not in line and data.count('backend') < 2:
                add = True
            elif data.count('backend') >= 2:
                add = False
            if add:
                data += line

    if data.count('backend') >= 2:
        data = data[:data.rindex('backend')]
    print(data)


while True:
    print('Beck 的 爛 HAProxy 加刪查 小程式'.center(50, '-'))
    do = input('請輸入您要進行的動作 A/a(dd) D/d(elete) C/c(heck) Q/q(uit)：')
    if do == 'A' or do == 'a':
        info = input('請輸入增加的值：\n')
        if 'backend' in info and 'record' in info:
            info = eval(info)
            proxy_add(**info)
        else:
            print('值輸入錯誤')
        time.sleep(2)
        os.system(clear)

    elif do == 'D' or do == 'd':
        info = input('請輸入刪除的值：\n')
        if 'backend' in info and 'record' in info:
            info = eval(info)
            proxy_del(**info)
        else:
            print('值輸入錯誤')
        time.sleep(2)
        os.system(clear)

    elif do == 'C' or do == 'c':
        info = input('請輸入查詢的值：\n')
        if 'backend' in info and 'record' in info:
            print('值輸入錯誤')
        else:
            proxy_chk(info)
        time.sleep(3)
        os.system(clear)

    elif do == 'Q' or do == 'q':
        break

    else:
        print('你到底要幹啥呢?')
        time.sleep(2)
        os.system(clear)