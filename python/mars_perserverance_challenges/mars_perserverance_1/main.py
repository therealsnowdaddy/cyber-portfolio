#!/usr/bin/python3
#Mars Perseverance Rover - Challenge #1 - www.101computing.net/mars-perseverance-rover/
#Solution by Matt Snowball
import turtle
screen = turtle.Screen()

# this assures that the size of the screen will always be 400x400 ...
screen.setup(400, 400)
screen.bgpic("mars-path-1.png")

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

intTravel1 = 335
intAngle1 = 90

#Implement Rover Path...
for i in range(3):
    rover.forward(intTravel1)
    rover.left(intAngle1)
rover.forward(intTravel1)



