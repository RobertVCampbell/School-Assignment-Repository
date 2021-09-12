'''
Created on Feb 23, 2016

@author: Robert Campbell
Purpose: A program that converts from decimal to octal
'''

start = int(0)
end = int(3)
i = True
binary = int(0)
decimal = int(0)
conv = int(0)
octal = ""

decimal = int(input("Please type a decimal number: "))

if decimal == 0:
    print(0)
else:#converts from decimal to binary
    binary = ""
    while decimal > 0:#while the decimal value exists
        remainder = decimal % 2
        decimal = decimal // 2
        binary = str(remainder) + binary#add a 1 to the binary string, only if it is in odd number at that exponent
    print("The binary representation is:", binary)
if len(binary) %3 != 0:#add leading zeroes to make the binary-octal conversion work
    binary = str("0") + binary
while i == True:
    exp = 2#modified from the binary-decimal conversion. Each chunk will have the highest exp of 2
    if binary[start:start+3] != "":#moving along the string in intervals of three
        for digit in binary[start:start+3]:
            conv = conv + int(digit) * 2 ** exp
            exp = exp - 1
        octal = octal + str(conv)#adds the converted value of 0-7 to the right of the octal string
        start = start + 3#increments to the next substring
        conv = int(0)#resets conv to 0 for the next loop
    else:
        break
print("The Octal representation is:", octal)
