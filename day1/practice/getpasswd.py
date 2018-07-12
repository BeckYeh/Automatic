#! /usr/bin/env python3
# -*- coding: utf-8 -*-
# Author BeckYeh

import getpass

username = input("Username：")
passwd = getpass.getpass("Password：")

print(username, passwd)
