#! /usr/bin/env python3
# -*- coding: utf-8 -*-
# Author BeckYeh

age_of_Beck = 27

count = 0

while count < 3:
    guess_age = int(input("Guess age："))
    if guess_age < age_of_Beck:
        print('Too small')
    elif guess_age > age_of_Beck:
        print('Too big')
    else:
        print('You got it')
        break
    count += 1
else:
    print('You have tried too many times.')


for i in range(3):
    guess_age = int(input("Guess age："))
    if guess_age < age_of_Beck:
        print('Too small')
    elif guess_age > age_of_Beck:
        print('Too big')
    else:
        print('You got it')
        break
    count += 1
else:
    print('You have tried too many times.')