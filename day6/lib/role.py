#! /usr/bin/env python3
# -*- coding: utf-8 -*-
# Author BeckYeh

import sys
import os
import pickle
basedir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.append(basedir)

import conf.setting

class Admin(object):
    def __init__(self, username, password):
        self.Username = username
        self.Password = password

    def create_teacher(self):
        pass

    def create_class(self):
        pass

    def create_course(self):
        pass

class School(object):

    def __init__(self, name, address):
        self.Name = name
        self.Address = address
        self.Course = dict()
        self.Classes = dict()
        self.Teacher = dict()
        self.Student = dict()

    def __del__(self):

        pass


class Course(object):
    def __init__(self, week, price):
        self.week = week
        self.price = price

class Classes(object):
    def __init__(self, course, teacher):
        self.course = course
        self.teacher = teacher
        self.student = dict()

class Student(object):
    def __init__(self, name, money, study, username, password):
        self.money = money
        self.study = study
        self.name = name
        self.Username = username
        self.Pass = password
        self.cource = list()

    def pay(self, store):
        self.money += store

    def choose_class(self, cource):
        if self.cource != "":
            self.cource = cource

class teacher(object):
    def __init__(self, name, username, password):
        self.Name = name
        self.Username = username
        self.Pass = password

    def manager_class(self):
        pass

    def choose_teach_class(self):
        pass

    def check_class_student(self):
        pass

    def edit_student_score(self):
        pass
