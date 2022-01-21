#!/usr/bin/env python3
__author__ = 'Amelia Wake (aw3021@ic.ac.uk)'
__version__ = '0.0.1'
# Filename: using_name.py

# If some other module (not boilerplate) is the main programme, and you want to import 
# the boilerplate module into it, the interpreter looks at the filename of your module,
# strips off the .py, and assigns that string to the imported module's __name__ variable
# instead, skipping the commands under the if statement of boilerplate.py.

# This script illustrates this.

if __name__ == '__main__':
    """
    Makes sure the "main" function is called from command line.
    """  
    print('This programme is being run by itself')
else:
    print('I am being imported from another module')

print("This module's name is: " + __name__)