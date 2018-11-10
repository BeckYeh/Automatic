#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# Author Beck

import re

s = input('請輸入算式 : ')
if s[0] != '(':
    s = '(' + s + ')'

s = re.sub(' ', '', s)

need_pro = True

while need_pro:
    s = s.replace('--', '+')
    s = s.replace('++', '+')
    if '(' in s:
        sub = re.search(r'\([^()]+\)', s).group()
        s = s.replace(sub, '{}', 1)
        if '*' in sub or '/' in sub:
            mul = re.search('(\d+\.*\d*)([\*\/])(-*\d+\.*\d*)', sub).group()
            sub = sub.replace(mul, '{}', 1)
            if '*' in mul:
                tmp = re.split('\*', mul)
                mul = float(tmp[0]) * float(tmp[1])
            elif '/' in mul:
                tmp = re.split('/', mul)
                mul = float(tmp[0]) / float(tmp[1])
            sub = sub.format(mul)
        else:
            plus = re.search('(-*\d+\.*\d*)([\+\-])(-*\d+\.*\d*)', sub)
            if plus is not None:
                sub = sub.replace(plus.group(), '{}')
                plus = plus.groups()
                if '+' == plus[1]:
                    plus = float(plus[0]) + float(plus[2])
                elif '-' == plus[1]:
                    plus = float(plus[0]) - float(plus[2])
                sub = sub.format(plus)
            else:
                sub = sub.replace(sub, re.search('-*\d+\.*\d*', sub).group())
        s = s.format(sub)
    else:
        need_pro = False

print('答案 = ', s)

