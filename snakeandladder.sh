#!/bin/bash -x
echo "------------------------------------------Welcome To SnakeAndLadder------------------------------------------"
PLAYER1_START_POS=0
WIN_POS=100
NO_PLAY=0
SNAKE=1
LADDER=2
pos=$PLAYER1_START_POS
rolldie=$((RANDOM%6+1))

function checkOptions(){
options=$((RANDOM%3))
while [[ $pos -lt $WIN_POS ]]
do
	if [ $options -eq 0 ]
	then
		pos=$PLAYER1_START_POS
	elif [ $options -eq 2 ]
	then 
		pos=$(($pos+$rolldie))
		if [ $pos -gt $WIN_POS ]
		then
		pos=$(($pos-$rolldie))
      fi
	else
		pos=$(($pos-$rolldie))
		if [ $pos -lt $PLAYER1_START_POS ]
		then 
			pos=$PLAYER1_START_POS
		fi
	fi
		echo "player position:" $pos
done
}
checkOptions
