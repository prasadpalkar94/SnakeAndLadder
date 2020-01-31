#!/bin/bash -x
echo "------------------------------------------Welcome To SnakeAndLadder------------------------------------------"
player1_start_pos=0
NO_PLAY=0
SNAKE=1
LADDER=2
pos=$player1_start_pos
rolldie=$((RANDOM%6+1))

function checkOptions(){
options=$((RANDOM%3))
if [ $options -eq 0 ]
then
	pos=$player1_start_pos
elif [ $options -eq 1 ]
then 
	pos=$(($pos+$rolldie))
else
	pos=$(($pos-$rolldie))
fi
}
 
checkOptions
