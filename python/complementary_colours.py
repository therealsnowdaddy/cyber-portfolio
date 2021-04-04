#!/usr/bin/python3
#Complementary Colours Algorithm - www.101computing.net/complementary-colours-algorithm
#Solution by Matt Snowball

#Complete the code here...
print("Please input a number between 0 and 255 for each colour.\n")

intRed = int(input("Red value  : "))
intGreen = int(input("Green value: "))
intBlue = int(input("Blue value : "))

if intRed < 0 or intGreen < 0 or intBlue < 0 or intRed > 255 or intGreen > 255 or intBlue > 255:
    print("Incorrect value provided.")
    exit()

intRedComp = 255 - intRed
intGreenComp = 255 - intGreen
intBlueComp = 255 - intBlue

print("Complementary colour set:\n")

print("Red value  : " + str(intRedComp))
print("Green value: " + str(intGreenComp))
print("Blue value : " + str(intBlueComp))