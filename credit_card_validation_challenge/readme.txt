Validating Credit Card Numbers

## Description

Program to validate credit card numbers from https://www.hackerrank.com/challenges/validating-credit-card-number/problem for applying to Comcast

Prior to validation any hyphens are removed. Validation is performed for the occurrance of any other special characters post removal

► It must start with a 4, 5 or 6. -> Validated on line 25
► It must contain exactly 16 digits. -> Validated on line 19 
► It must only consist of digits (-). -> Validated on line 22 post removal of hyphens 
► It may have digits in groups of 4, separated by one hyphen "-". -> This validation is met by the above, since post hyphen removal the only thing left should be 16 digits
► It must NOT use any other separator like ' ' , '_', etc. -> Also performed above on line 22 in the only digits validation
► It must NOT have 4 or more consecutive repeated digits. -> Validated in the function cc_repeating starting on line 36

## Prerequisites

Python3

## Usage

chmod +x cc_check.py
./cc_check.py

An example file containing both valid and invalid numbers is provided and passed to the program (ccfile.csv)
