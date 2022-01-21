#!/usr/bin/env python3
__author__ = 'Amelia Wake (aw3021@ic.ac.uk)'
__version__ = '0.0.1'

# Assigning a global variable. 
_a_global = 10 

# If global variable is less than or equal to 5 then add 5 and reassign to another global
# variable.
if _a_global >= 5:
    _b_global = _a_global + 5 
    
# Print strings to console.
print("Before calling a_function, outside the function, the value of _a_global is", _a_global)
print("Before calling a_function, outside the function, the value of _b_global is", _b_global)

def a_function():
    """
    This function assigns a number to a local variable, if this variable is less than or equal to 4,
    add 5 and assign to a new local variable. The original local variable is given a new number.
    """
    _a_global = 4 # a local variable. Despite a_global being overwritten inside of the function, the change only remained inside of the function.
    
    if _a_global >= 4:
        _b_global = _a_global + 5 # also a local variable
    
    _a_local = 3 # This does not persist outside of the function.
    
    print("Inside the function, the value of _a_global is", _a_global)
    print("Inside the function, the value of _b_global is", _b_global)
    print("Inside the function, the value of _a_local is", _a_local)
    
# Calling the function after it has been defined.
a_function()

print("After calling a_function, outside the function, the value of _a_global is (still)", _a_global)
print("After calling a_function, outside the function, the value of _b_global is (still)", _b_global)

# We get an error here.
print("After calling a_function, outside the function, the value of _a_local is ", _a_local)

############################################################################################

# If we assign a variable outside of a function, it will be available inside it even if
# we didn't assign it inside of the function. 
_a_global = 10

def a_function():
    """
    This function assigns a number to a local variable and then attempts to print to the
    console.
    """
    _a_local = 4
    
    print("Inside the function, the value _a_local is", _a_local)
    print("Inside the function, the value of _a_global is", _a_global)
    
a_function()

print("Outside the function, the value of _a_global is", _a_global)

############################################################################################

_a_global = 10

print("Before calling a_function, outside the function, the value of _a_global is", _a_global)

def a_function():
    """
    This function is used to modify or assign a global variable from inside of a function
    using the global keyword.
    """
    global _a_global # Converts to a truly global variable that becomes available outside of the function (overwriting the original _a_global).
    _a_global = 5
    _a_local = 4
    
    print("Inside the function, the value of _a_global is", _a_global)
    print("Inside the function, the value _a_local is", _a_local)
    
a_function()

print("After calling a_function, outside the function, the value of _a_global now is", _a_global)

###########################################################################################

def a_function():
    """
    This function is used to convert and overwrite a global variable.
    """
    _a_global = 10

    def _a_function2():
        """
        This function is used to demonstrate that the global keyword can still work
        from inside of a nested function.
        """
        global _a_global
        _a_global = 20
    
    print("Before calling a_function2, value of _a_global is", _a_global)

    _a_function2()
    
    print("After calling a_function2, value of _a_global is", _a_global)
    
a_function()

print("The value of a_global in main workspace / namespace now is", _a_global)

###########################################################################################

# Defined in advance, outside of the first function.
_a_global = 10

def a_function():
    """
    This function is used to show how global can still work from inside of a 
    nested function.
    """

    def _a_function2():
        global _a_global # Given a global desgination befoe being reassigned.
        _a_global = 20
    
    print("Before calling a_function2, value of _a_global is", _a_global)

    _a_function2()
    
    print("After calling a_function2, value of _a_global is", _a_global)

a_function()

print("The value of a_global in main workspace / namespace is", _a_global)