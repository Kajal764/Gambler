#!/bin/bash -x

echo "!!! Welcome To Gambling Simulator... !!!"

#constant
BET=1
STAKE=100
LIMIT=$(( 50 * $STAKE / 100 ))
LOW_LIMIT=$(( STAKE - LIMIT))
HIGH_LIMIT=$((STAKE + LIMIT))


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
	echo $cash	$win	$loss
done
