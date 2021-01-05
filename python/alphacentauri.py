#Alpha-Centauri Distance Converter - www.101computing.net/mission-alpha-centauri

speedOfLight = 300000 #km/s
destinations = []
destinations.append(["Alpha Centauri", 4.24])
destinations.append(["Barnard's Star", 5.96])
destinations.append(["Luhman", 6.59])
destinations.append(["WISE", 7.20])
destinations.append(["Wolf 359", 7.78])
loopFlag = 1


def secondsInAYear():
  seconds = 60 * 60 * 24 * 365.25
  return seconds
  
def distanceTo(num):
  num = num - 1
  distance = ( secondsInYear * speedOfLight ) * destinations[num][1]
  print("The distance to " + str(destinations[num][0]) + " is " + str(distance) + " km.")

numDestinations = len(destinations)
# secondsInYear = 60 * 60 * 24 * 365.25 #s/year
secondsInYear = secondsInAYear()

while loopFlag == 1:
  for i in range(0,numDestinations,1):
    print(str(i + 1) + ". " + str(destinations[i][0]))
  
  destChoice = int(input("Please enter a choice from the list above, or anything else to exit."))
  # distance = ( secondsInYear * speedOfLight ) * alphaCentauri
  
  if destChoice > 0 and destChoice < 6:
    distanceTo(destChoice)
  else:
    loopFlag = 0
    exit
