#!/usr/bin/python3
#Mars Perseverance Rover - Challenge #3 - www.101computing.net/mars-perseverance-rover/
#Solution by Matt Snowball

import turtle
import time
screen = turtle.Screen()

# this assures that the size of the screen will always be 400x400 ...
screen.setup(400, 400)
screen.bgpic("mars-path-2.png")

# Initialise the rover...
rover = turtle.Turtle()
screen.register_shape("rover.png", ((0,0), (22,30)))
rover.shape("rover.png")
rover.speed(100)

rover.color("#810000")
rover.pensize(4)
rover.penup()
rover.goto(-165,-165)
rover.pendown()

intTravel1 = 330
intTravel2 = 48
intAngle1 = 90

def moveAcross():
    rover.forward(intTravel1)
    
def leftTurn():
    rover.left(intAngle1)
    rover.forward(intTravel2)
    rover.left(intAngle1)
    
def rightTurn():
    rover.right(intAngle1)
    rover.forward(intTravel2)
    rover.right(intAngle1)

def itteration():
    moveAcross()
    leftTurn()
    moveAcross()
    rightTurn()
    
#Implement Rover Path...
for i in range(3):
    itteration()
moveAcross()
leftTurn()
moveAcross()

time.sleep(5)