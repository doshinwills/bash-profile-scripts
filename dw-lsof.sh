#!/bin/bash

dwlsof () {

lsofdw_output

echo -e "\n\nEnter Input: " && read input && echo -e "\n"

lsofdw_output $input

unset input
}

lsofdw_block () {

if [ -z "$1" ] || [ "$1" = "$2" ] || [ "$1" = "a" ]
then
	echo -E "$2. $3"
fi
if [ "$1" = "$2" ] || [ "$1" = "a" ]
then
	echo -E 'eg.'
	for value in "${com[@]}"; 
	do 
	     echo -e "$value"; 
	done
	echo
fi
}

lsofdw_output () {

if [ -z "$1" ] 
then
	echo -e 'dwlsof:input\n'
else
	echo -e 'dwlsof:help\n'
fi

cur=1

des='Check Listening Ports'
declare -a com=(
	'sudo lsof -nP -iTCP -sTCP:LISTEN'
)
lsofdw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='Info about a process that listens on a port'
declare -a com=(
	'sudo lsof -nP -iTCP:<<PORT_NUMBER>> -sTCP:LISTEN'
)
lsofdw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))
}














