#!/bin/bash

cd $1

pwd

rmdir $1_Notes
touch Notes_$1

echo "Directory reset..."
