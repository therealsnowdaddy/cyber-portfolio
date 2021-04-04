#!/usr/bin/python3
#Professor Snape's Magic Potions - www.101computing.net/professor-snape-s-magic-potions
#Solution by Matt Snowball

dictPotions = {
    "invisibility" : {
        "file" : "invisibility-potion.txt",
        "name" : "Invisibility Potion"
        },
    "antidote" : {
        "file" : "poison-antidote.txt",
        "name" : "Poison Antidote Potion"
        },
    "aging" : {
        "file" : "aging-potion.txt",
        "name" : "Aging Potion"
        },
    "babbling" : {
        "file" : "babbling-beverage.txt",
        "name" : "Babbling Beverage Potion"
        }
}
def displayHeader():
    print("#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#")
    print("#          Magic Potions         #")
    print("#             Recipes            #")
    print("#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#")
    print("")

def readPotionFile(intPotionIndex):
    # intPotionFileIndex = intPotionIndex - 1
    potionName = list(dictPotions.keys())[intPotionIndex - 1]
    print("\n\n")
    #Open text file in read mode
    file = open(dictPotions[potionName]["file"],"r")
  
    print("#~~~ " + dictPotions[potionName]["name"] + " ~~~#\n")
  
    step=1
    #Read and display each line one by one
    for line in file:
        print("Step " + str(step) + ":")
        print("   " + line)
        step = step + 1
  
    #Close the text file
    file.close()  

def choosePotion():
    intPotionChoice = int(input("Please choose a potion by typing the number: "))
    readPotionFile(intPotionChoice)

def showPotionMenu():
    i = 1
    for name, defs in dictPotions.items():
        print(str(i) + ". " + str(defs["name"]))
        i = i + 1
    

###############################################
#          Main Program Starts Here           #
###############################################

strContinue = "Y"
while (strContinue == "y" or strContinue == "Y"):
    displayHeader()
    showPotionMenu()
    choosePotion()
    strContinue = input("\nWould you like to see another recipe?\n" +
        "Press 'Y' to continue (any other key to exit): ")