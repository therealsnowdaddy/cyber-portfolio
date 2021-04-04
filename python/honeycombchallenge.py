#!/usr/bin/python3
#The honeycomb challenge - www.101computing.net/honeycomb-challenge/
#Solution by Matt Snowball

import turtle
import time
myPen = turtle.Turtle()
myPen.shape("arrow")

myPen.color("#a86f14")
myPen.fillcolor("#efb456")
myPen.pensize(2)
myPen.speed(100) #Set the speed of the turtle

#A Procedue to draw a pentagonal cavity at a given (x,y) position.
def drawCavity(x,y,edgeLength):
  myPen.penup()
  myPen.goto(x,y)
  myPen.pendown()
  myPen.begin_fill()
  for i in range(0,6):
      myPen.forward(edgeLength)
      myPen.left(60)
  myPen.end_fill()    


#Main Program Starts Here
#Comlpete this code to draw a full honeycomb pattern
for x in range(-150,150,60):
  drawCavity(x,150,20)
  drawCavity(x-30,150-17,20)
  drawCavity(x,150-34,20)
  drawCavity(x-30,150-51,20)

myPen.hideturtle()
time.sleep(5)