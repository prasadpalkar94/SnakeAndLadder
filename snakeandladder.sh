#!/bin/bash -x  
echo "------------------Welcome To SnakeAndLadder-----------------------"
declare -A dice
PLAYER1_START_POS=0
WIN_POS=100
NO_PLAY=1
LADDER=2
SNAKE=3
pos=$PLAYER1_START_POS

function roll(){
randomCheck=$((RANDOM%6+1))
echo $randomCheck
}


function checkOptions(){
while [[ $pos -ne $WIN_POS ]]
do
options=$((RANDOM%3+1))
			((total++))
	case $options in 
			  $NO_PLAY)pos=$PLAYER1_START_POS ;;
			  $LADDER)pos=$((pos+$(roll)))   ;;
			  $SNAKE)pos=$((pos-$(roll)))   ;;
	esac
   if [[ $pos -lt $PLAYER1_START_POS ]]
   then 
      pos=$PLAYER1_START_POS
   fi

	 if [[ $pos -gt $WIN_POS ]]
   then 
      pos==$((pos-$(roll)))
   fi

	dice[$total]=$pos
done
}
checkOptions
${!dice[@]}
${dice[@]}
