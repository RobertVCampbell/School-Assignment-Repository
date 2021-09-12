'''
Created on Feb 23, 2016

@author: Robert Campbell
Purpose: to convert any non-ten base value into a decimal value.
'''

hexNum = {}
hexNum['0'] = "0"
hexNum['1'] = "1"
hexNum['2'] = "2"
hexNum['3'] = "3"
hexNum['4'] = "4"
hexNum['5'] = "5"
hexNum['6'] = "6"
hexNum['7'] = "7"
hexNum['8'] = "8"
hexNum['9'] = "9"
hexNum['A'] = "10"
hexNum['B'] = "11"
hexNum['C'] = "12"
hexNum['D'] = "13"
hexNum['E'] = "14"
hexNum['F'] = "15"

def conversion(base, num):
    decimal = 0
    exp = len(num) - 1
    for digit in num:
        if base == "16":
            digit = digit.replace(digit, hexNum[digit])
        decimal = decimal + int(digit) * int(base) ** exp
        exp = exp - 1
    return decimal

def main():
    num = input("Enter the number you would like to convert to decimal:")
    base = input("Enter the base that the number is in:")
    num = num.upper()
    
    print("The decimal value is:", conversion(base, num))

main()