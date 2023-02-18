#!/bin/bash

dwgit () {

gitdw_output

echo -e "\n\nEnter Input: " && read input && echo -e "\n"

gitdw_output $input

unset input
}

gitdw_block () {

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

gitdw_output () {

if [ -z "$1" ] 
then
	echo -e 'dwgit:input\n'
else
	echo -e 'dwgit:help\n'
fi

cur=1

des='Check out a remote branch'
declare -a com=(
	'git fetch origin && git switch -c <<BRANCH_NAME>> origin/<<BRANCH_NAME>>'
)
gitdw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))
}
