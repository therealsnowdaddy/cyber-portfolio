#!/usr/bin/python3
#How old will you be in 2050? -  www.101computing.net/year-2050
#Solution by Matt Snowball

import time

now = time.time()
thisYear = int(1969 + now//(365*24*3600))

print("We are in " + str(thisYear))
age = int(input("How old are you?"))

birthYear = thisYear - age

print("You are " + str(age) + " years old.")
print("You were born in " + str(birthYear) + ". A great year!")

for i in range(0,10,1):
#  age = age+i
  print("In " + str(thisYear + i) + " you will be " + 
  str(age + i) + " years old.")

yearsToTwentyFifty = 2050 - thisYear
ageInTwentyFifty = age + yearsToTwentyFifty

yearsToTwentyOne = 21 - age
if yearsToTwentyOne >= 0:
  print("You will be 21 in " + str(yearsToTwentyOne) + " years!")
else:
  print("You turned 21, " + str(abs(yearsToTwentyOne)) + " years ago.")

print("In 2050, you will be..." + str(ageInTwentyFifty))
#Complete this program to tell the user how old they will be in 2050.