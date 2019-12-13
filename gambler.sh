#!/bin/bash -x

echo "!!! Welcome To Gambling Simulator... !!!"

#constant
BET=1
STAKE=100

#variable
limit=$((50*$STAKE/100))
lowLimit=$(($STAKE-$limit))
highLimit=$(($STAKE+$limit))
cash=$STAKE

while [[ $cash -gt $lowLimit && $cash -lt $highLimit ]]
do
	if [[ $((RANDOM%2)) -eq 0 ]]
	then
		cash=$(($cash+$BET))
	else
		cash=$(($cash-$BET))
	fi
done
echo $cash
