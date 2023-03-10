#!/bin/bash

dwcut () {

cutdw_output

echo -e "\n\nEnter Input: " && read input && echo -e "\n"

cutdw_output $input

unset input
}

cutdw_block () {

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

cutdw_output () {

if [ -z "$1" ] 
then
	echo -e 'dwcut:input\n'
else
	echo -e 'dwcut:help\n'
fi

cur=1

des='Cut with delimiter 1. tab 2. :'
declare -a com=(
	'ls -lart | cut -d "," -f 2'
	'cut -f 2 <<filename>>'
	'cut -d ":" -f 2 <<filename>>'
	'cut -d ":" -f 2,5 <<filename>>'
	'cut -d ":" -f 2-5 <<filename>>'
)
cutdw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='Cut the 5th character'
declare -a com=(
	'cut -c 5 <<filename>>'
)
cutdw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='Complement a selection'
declare -a com=(
	'cut -f 1 --complement <<filename>>'
)
cutdw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='Specify an Output Delimiter'
declare -a com=(
	'cut -f 1,3 --output-delimiter="_" <<filename>>'
)
cutdw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='Replace space to tab'
declare -a com=(
	'ls -l | awk -v OFS="\t" '$1=$1' | cut -f <<column_number>>'
)
cutdw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))
}














