#!/usr/bin/python3
#Mars Perseverance Rover - Challenge #3 - www.101computing.net/mars-perseverance-rover/
#Solution by Matt Snowball

import turtle
screen = turtle.Screen()

# this assures that the size of the screen will always be 400x400 ...
screen.setup(400, 400)
screen.bgpic("mars-path-3.png")

# Initialise the rover...
rover = turtle.Turtle()
screen.addshape("rover.png")
rover.shape("rover.png")
rover.speed(100)

rover.color("#810000")
rover.pensize(4)
rover.penup()
rover.goto(-165,-165)
rover.pendown()

#Implement Rover Path...

intTravel = 330
intTravelLess = 48
intAngle1 = 90

def itterate():
    rover.forward(intTravel)
    rover.left(intAngle1)
    
#Implement Rover Path...
for i in range(3):
    itterate()
for i in range(6):
    intTravel = intTravel - intTravelLess
    for j in range(2):
        itterate()