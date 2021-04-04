#!/usr/bin/python3
#Mars Perseverance Rover - Challenge #5 - www.101computing.net/mars-perseverance-rover/
#Solution by Matt Snowball

import turtle
import time
screen = turtle.Screen()

# this assures that the size of the screen will always be 400x400 ...
screen.setup(400, 400)
screen.bgpic("mars-path-5.png")

# Initialise the rover...
rover = turtle.Turtle()
screen.register_shape("rover.png", ((0,0), (22,30)))
rover.shape("rover.png")
rover.speed(100)

rover.color("#810000")
rover.pensize(4)
rover.penup()
rover.goto(-40,-160)
rover.pendown()

#Implement Rover Path...
def turnAndBurn(angle,distance):
    rover.left(angle)
    rover.forward(distance)

rover.forward(93)
for i in range(11):
    turnAndBurn(30,93)


time.sleep(5)