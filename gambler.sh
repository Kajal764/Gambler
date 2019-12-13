#!/bin/bash -x

echo "!!! Welcome To Gambling Simulator... !!!"

#constant
BET=1
STAKE=100
LIMIT=$(( 50 * $STAKE / 100 ))
LOW_LIMIT=$(( STAKE - LIMIT))
HIGH_LIMIT=$((STAKE + LIMIT))
playingTime=1

function checkForNextGambler(){
   if [[ $value -gt 0 ]]
   then
   	playingTime=$(($playingTime+1))
      	echo "play $playingTime time"
      	getTotalAmount
   else
	echo "Better Luck For Next Time!!!"
   fi
}

function getLuckyUnluckyDay(){

   for(( i=1;i<=20;i++ ))
   do
      echo "day$i ${totalCash[$i]}"
   done | sort -k2 -nr | awk 'NR==1 { print($1 " luckiest day and maximum cash is "$2) } AND  awk NR==20 {print($1 " unluckiestday and minimum cash is " $2)}'
}


function getTotalAmount(){
	value=0
	declare -A totalCash
	for (( i=1;i<=20;i++ ))
	do
		cash=$STAKE
		win=0
		loss=0
			while [[ $cash -gt $LOW_LIMIT && $cash -lt $HIGH_LIMIT ]]
			do
				if [[ $((RANDOM%2)) -eq 0 ]]
				then
					win=$(($win+1))
					cash=$(($cash+$BET))
				else
					loss=$(($loss+1))
					cash=$(($cash-$BET))
				fi
			done
	 	value=$(($value+$(($STAKE-$cash))))
	 	totalCash[$i]=$value
	done

	getLuckyUnluckyDay
	(checkForNextGambler $value)
}
getTotalAmount

