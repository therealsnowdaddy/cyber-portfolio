#!/usr/bin/python3
#The commuter's puzzle - www.101computing.net/to-the-moon-and-back
#Solution by Matt Snowball

kmPerMile = 1.609
weeksPerYear = 52
moonDistanceInKM = 383200

oneWayTrainInMiles = 60
workDaysPerWeek = 5

distTravelledInKM = 0
daysTravelled = 0
weeksTravelled = 0
yearsTravelled = 0

def convertMilesToKM(miles):
   km = miles * kmPerMile
   return km

oneWayTrainInKM = convertMilesToKM(oneWayTrainInMiles)

dayTrainInKM = oneWayTrainInKM * 2

while distTravelledInKM < (moonDistanceInKM * 2):
   distTravelledInKM = distTravelledInKM + oneWayTrainInKM
   daysTravelled = daysTravelled + 1
  # print(str(daysTravelled) + "..." + str(distTravelledInKM))

weeksTravelled = daysTravelled/workDaysPerWeek
yearsTravelled = weeksTravelled/weeksPerYear

print("Distance travelled equals that of a trip to the moon and back after:\n")
print("Days: " + str(daysTravelled))
print("Weeks: " + str(weeksTravelled))
print("Years: " + str(yearsTravelled))

