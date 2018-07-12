#! /usr/bin/env python3
# -*- coding: utf-8 -*-
# Author BeckYeh
import os

def sed(file_name, old_str, new_str):
    date = str()
    if  os.path.split(file_name)[1] not in os.listdir(os.path.split(file_name)[0]):
        print("Can\'t find file")
        return 0
    elif type(old_str) != str :
        print('{0} not a string!'.format(old_str))
        return 0
    elif type(new_str) != str:
        print('{0} not a string!'.format(new_str))
        return
    else:
        with open(file_name, 'r') as f:
            for i in f:
                if old_str in i:
                    i = i.replace(old_str, new_str)
                date += i

        with open(file_name, 'w') as f:
            f.write(date)
        return 1
