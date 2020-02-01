#!/bin/bash -x
echo "------------------Welcome To SnakeAndLadder-----------------------"
declare -A randomCheck
PLAYER1_START_POS=0
WIN_POS=100
NO_PLAY=1
LADDER=2
SNAKE=3
pos=$PLAYER1_START_POS

function roll(){
randomCheck=$((RANDOM%6 + 1))
echo $randomCheck
((totalrandomCheck++))
}

function checkOptions(){
options=$((RANDOM%3 + 1))
	case $options in
			  $NO_PLAY)pos=$pos ;;
			  $LADDER)pos=$(( $pos + $randomCheck ))
			    		 if [ $pos -gt $WIN_POS ]
  						 then
     					 	pos=$(( $pos - $randomCheck ))
  						 fi
					  	;;
				$SNAKE)pos=$(( $pos - $randomCheck ))
						if [ $pos -lt $PLAYER1_START_POS ]
  						then
     				   	pos=$PLAYER1_START_POS
  					   fi
					   ;;
	esac
	echo $pos
}

while [ $pos -lt $WIN_POS ]
do
 roll
 checkOptions
done
echo "Number Of Time randomCheck Tossed: "$totalrandomCheck

