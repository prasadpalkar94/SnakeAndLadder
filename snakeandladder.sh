#!/bin/bash -x
echo "------------------Welcome To SnakeAndLadder-----------------------"
declare -A randomCheck
PLAYER_START_POS=0
WIN_POS=100
NO_PLAY=1
LADDER=2
SNAKE=3
PLAYER1=1
PLAYER2=2

pos=$PLAYER_START_POS

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
						if [ $pos -lt $PLAYER_START_POS ]
  						then
     				   	pos=$PLAYER_START_POS
  					   fi
					   ;;
	esac
	echo $pos
	echo Player $player won
}


function playerTurn()
{
	if [[ $((RANDOM%2 + 1)) -eq $PLAYER1 ]]
	then 
		player=1
	else
		player=2
	fi
}

while [ $pos -lt $WIN_POS ]
do
	roll
	checkOptions
	playerTurn
done
echo "Number Of Time randomCheck Tossed: "$totalrandomCheck
