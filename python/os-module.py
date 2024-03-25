"""
let python control your computer
"""

import os

# ask for input from user
dir = input('Enter a folder name: ')
num = int(input('Enter a number of files to create: '))

# this creates a new folder and create 3 files inside it
os.mkdir(dir)
os.chdir(dir)

for i in range(num):
    open(f'file{i+1}.txt', 'w')
    print(os.getcwd())
    print(os.listdir())
