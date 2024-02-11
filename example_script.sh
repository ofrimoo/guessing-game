#!/bin/bash

# this is a comment, let's start the script. 

# checking sudo 

if [ "$EUID" -ne 0 ]; then
	echo  "
	/\_/\ 
       ( o.o )
        > ^ <
"
	echo -e "bot: oh oh. I need write premissions in order to\ncreate your winner certificate incase you win my game.\nplease rerun the script with sudo. e.g\n'sudo ./example_script.sh' ! :)"
    exit 1
fi

# set winner variable 

winner=0

# say stuff..

echo " 
 /\_/\ 
( o.o )
 > ^ <
bot: hello! welcome to the guessing game, created by ofri."

echo "before we begin.. what's your name?"

# read the response..

read name

# winner func for later 

function winner_certificate() {
	echo "bot: creating winner certificate.."
	touch "$name's_certificate".txt
	echo -e "$name WON the guessing game!\ngood job to them." > "$name's_certificate".txt
	sleep 2
	echo "all done! check the current directory for your certificate."
}

# ask stuff ..

echo "$name: $name"

echo "bot: hello $name. want to play a game? (y/n)"

# read response..

read response 

echo "$name: $response"

# if function

if [ "$response" != "n" ]; then
	echo "great! let's go"
else
	echo "booo" 
	exit 1
fi

# start the game

echo "bot: The guessing game has started. you have 3 tries to try to guess the name of the person that I have in mind."

# set answer variable 

answer="tyler joseph"

# the guessing starts..

echo "now guess.."

read guess1

echo "$name: $guess1"

# if function

if [ "$guess1" = "$answer" ]; then
	echo "bot: good job! $guess1 is correct!"
	winner=1
	winner_certificate
	exit 1
else
	echo "bot: sorry... $guess1 is wrong. try again? (y/n)"

	read response1
	
	if [ "$response1" != "y" ]; then 
		exit 1
fi
	
	echo "bot: let's try again! now guess.."
	
	read guess2

	echo "$name: $guess2"
	
	if [ "$guess2" = "$answer" ]; then 
		echo "bot: you did it! $answer is the right answer!"
		winner=1
		winner_certificate
		exit 1
	else
		echo "bot: sorry. $guess2 is wrong. let's try one more time."
		echo "since this is your last round, do you need a hint? (y/n)"
		read response3

		if [ "$response3" != "n" ]; then
			echo "bot: here is your hint: _____ ______"
		fi
	fi
		
		echo "okay. now guess.."
		
		read response4

		echo "$name: $response4"

		if [ "$response4" = "$answer" ]; then
			echo "bot: good job! you won!"
			winner=1
			winner_certificate
			exit 1
		else
			echo "bot: boooo.. sorry $name.. you lost... the answer was $answer"
			exit 1
		fi
fi

