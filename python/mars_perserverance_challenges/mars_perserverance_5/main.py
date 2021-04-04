#!/usr/bin/python3
#Mars Perseverance Rover - Challenge #5 - www.101computing.net/mars-perseverance-rover/
#Solution by Matt Snowball

import turtle
import time
screen = turtle.Screen()

# this assures that the size of the screen will always be 400x400 ...
screen.setup(400, 400)
screen.bgpic("mars-path-4.png")

# Initialise the rover...
rover = turtle.Turtle()
screen.register_shape("rover.png", ((0,0), (22,30)))
rover.shape("rover.png")
rover.speed(100)

rover.color("#810000")
rover.pensize(4)
rover.penup()
rover.goto(-160,-135)
rover.pendown()

def itterate(angle,distance):
    rover.left(angle)
    rover.forward(distance)

listAngles = [17,45,107,80]
listDistances = [230,150,205,250]
#Implement Rover Path...
#rover.forward(100)

for i in range(4):
    print(i)
    print(listAngles[i])
    print(listDistances[i])
    itterate(listAngles[i],listDistances[i])

time.sleep(5)