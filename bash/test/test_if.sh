#!/bin/bash

testVar=5
controlVar=5

# CHECK UID

if [ $UID -eq 0 ]
then
   echo "WARNING: Root user!"
else
   echo "Regular user access."  
fi
# EQUAL (-eq)

echo "EQUAL"

if [ $controlVar -eq $testVar ]
then
   echo "YES it is!"
else
   echo "NO it is not"
fi
# NOT EQUAL (-ne)

echo "NOT EQUAL"

if [ $controlVar -ne $testVar ]
then
   echo "YES it is!" 
else
   echo "NO it is not"
fi

# STRING EQUAL (==)

echo "DOUBLE EQUAL"

if [ "$controlVar" == "$testvar" ]
then
   echo "YES it is!"
else
   echo "NO it is not"
fi

# GREATER THAN (-gt)

echo "GREATER THAN"

if [ $controlVar -gt $testVar ]
then
   echo "YES it is!"
else
   echo "NO it is not"
fi

# LESS THAN (-lt)

echo "LESS THAN"

if [ $controlVar -lt $testVar ]
then
   echo "YES it is!"
else
   echo "NO it is not"
fi

# DIRECTORY EXIST

echo "DIRECTORY EXISTS"

if [ -d $HOME/Desktop ]
then
   echo "YES it does!"
else
   echo "NO it does not..."
fi

# FILE EXIST

echo "FILE EXISTS"

if [ -e $HOME/.zsh ]
then
   echo "YES it's there!"
else
   echo "NO it is not"
fi

