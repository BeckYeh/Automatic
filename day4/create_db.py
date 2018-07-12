#! /usr/bin/env python3
# -*- coding: utf-8 -*-
# Author BeckYeh

import sqlite3

conn = sqlite3.connect('employee.db')
c = conn.cursor()

c.execute('''CREATE TABLE employee
             ( staff_id INTEGER PRIMARY KEY AUTOINCREMENT,
             name TEXT NOT NULL,
             age INTEGER NOT NULL,
             phone INTEGER NOT NULL,
             dept TEXT NOT NULL,
             enroll_date TEXT NOT NULL);''')
conn.commit()

conn.close()