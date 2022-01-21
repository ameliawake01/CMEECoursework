#!/usr/bin/env python3
__author__ = 'Amelia Wake (aw3021@ic.ac.uk)'
__version__ = '0.0.1'

########################
def hello_1(x):
    """
    This function prints "hello" to the console everytime it finds a multiple of 
    3 in range(x).
    """
    for j in range(x):
        if j % 3 == 0:
            print('hello')
    print(' ')

hello_1(12)

########################
def hello_2(x):
    """
    This function prints "hello" to the console everytime it finds a number in range(x)
    that when divided by 5 = 3 or when divided by 4 = 3.
    """
    for j in range(x):
        if j % 5 == 3:
            print('hello')
        elif j % 4 == 3:
            print('hello')
    print(' ')

hello_2(12)

########################
def hello_3(x, y):
    """
    This function prints "hello" to the console for each iteration in range(x,y).
    """
    for i in range(x, y):
        print('hello')
    print(' ')

hello_3(3, 17)

########################
def hello_4(x):
    """
    This function prints "hello" to the console x+3 times while x is not equal to 15.
    """
    while x != 15:
        print('hello')
        x = x + 3
    print(' ')

hello_4(0)

########################
def hello_5(x):
    """
    This function prints "hello" to the console """
    while x < 100:
        if x == 31:
            for k in range(7):
                print('hello')
        elif x == 18:
            print('hello')
        x = x + 1
    print(' ')

hello_5(12)

# WHILE loop with BREAK
def hello_6(x, y):
    """
    This function prints "hello" to the console """
    while x: # while x is True
        print("hello! " + str(y))
        y += 1 # increment y by 1 
        if y == 6:
            break # exits the loop when the condition is met, otherwise we would get an infinite loop
    print(' ')

hello_6 (True, 0)