#!/bin/bash -x

echo "!!! Welcome To Gambling Simulator... !!!"

#constant
BET=1
STAKE=100

if [[ $((RANDOM%2)) -eq 0 ]]
then
	echo "win"
else
	echo "loss"
fi
