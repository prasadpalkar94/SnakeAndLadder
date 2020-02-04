#!/bin/bash -x
echo "------------------Welcome To SnakeAndLadder-----------------------"
PLAYER_START_POS=0
WIN_POS=100
NO_PLAY=1
LADDER=2
SNAKE=3
checkvalue=1

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
}


function playerTurn()
{
	if [[ $checkvalue -eq 1 ]]
	then 
		checkvalue=2
	else
		checkvalue=1
	fi
}

while [ $pos -ne $WIN_POS ]
do
	roll
	checkOptions
	playerTurn
done
echo "Number Of Time randomCheck Tossed: "$totalrandomCheck
echo Player $checkvalue won
