#!/usr/bin/python3

# Jason Teske
# 2022-02-16
# Program to provide to Comcast from hackerrank.com

# Import the modules

import re

# Define the credit card validation function

def cc_check(cc_number):
    # Remove any hyphens and newlines
    cc_number = cc_number.replace('-','')
    cc_number = cc_number.rstrip('\n')

    # Validate the length
    if (len(cc_number) != 16):
        return "invalid, failed on length"
    # Validate there are only digits
    elif (cc_number.isdigit() == False):
        return "invalid, failed on characters"
    # Validate that the first digit is 4, 5 or 6
    elif (re.match("4|5|6", cc_number) == None):
        return "invalid, failed on starting digit"
    # Call cc_repeating function to check for 4 or more repeating characters
    elif(cc_repeating(cc_number) == True):
        return "invalid, 4 or more repeating numbers"
    # Having met no above conditions, credit card number is valid
    else:
        return "valid"

# Define the function to check for repeating digits, called from within cc_check function

def cc_repeating(cc_number):

    # Initialization

    k = 0
    count = 0
    
    # Loop through string/array and add to count if digits repeat
    
    for i in cc_number:
        if (cc_number[k] == cc_number[k-1]):
            count += 1
            k += 1
            # If count reaches 4 or more repeating digits, return True and exit
            if (count >= 4):
                return True
                continue
        # Reset count to zero if digit stops repeating
        else:
            count = 0
            k += 1


### MAIN ###

# Open the file with the cc numbers

f = open("ccfile.csv");

# Loop through the file

for i in f:
    # Call the cc_check function and print the returned value
    cc_return = cc_check(i)
    # Prints return value of cc_check function
    print(cc_return)
