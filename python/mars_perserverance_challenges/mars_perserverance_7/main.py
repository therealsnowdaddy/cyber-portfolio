#!/usr/bin/python3
#Mars Perseverance Rover - Challenge #5 - www.101computing.net/mars-perseverance-rover/
#Solution by Matt Snowball
import turtle
screen = turtle.Screen()

# this assures that the size of the screen will always be 400x400 ...
screen.setup(400, 400)
screen.bgpic("mars-path-6.png")

# Initialise the rover...
rover = turtle.Turtle()
screen.addshape("rover.png")
rover.shape("rover.png")
rover.speed(100)

rover.color("#810000")
rover.pensize(4)
rover.penup()
rover.goto(-160,160)
rover.pendown()

#Implement Rover Path...
def turnAndBurn(angle,distance):
    rover.left(angle)
    rover.forward(distance)

listAngles = [280,10,90,35,85,10,44]
listDistances = [190,150,100,250,75,150,140]
#Implement Rover Path...
#rover.forward(100)

for i in range(len(listAngles)):
    print(i)
    print(listAngles[i])
    print(listDistances[i])
    turnAndBurn(listAngles[i],listDistances[i])

