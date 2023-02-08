#!/bin/bash

dwregex () {

regexdw_output

echo -e '\nA regex usually comes within this form /abc/, where the search pattern is delimited by two slash characters /'

echo -e "\n\nEnter Input: " && read input && echo -e "\n"

regexdw_output $input

unset input
}

regexdw_block () {

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

regexdw_output () {

if [ -z "$1" ] 
then
	echo -e 'dwregex:input\n'
else
	echo -e 'dwregex:help\n'
fi

cur=1
des='Matches starts with "The"'
declare -a com=(
	'^The'
)
regexdw_block "$1" "${cur}" "${des}" "${com}"

cur=2
des='Matches ends with "end"'
declare -a com=(
	'end$'
)
regexdw_block "$1" "${cur}" "${des}" "${com}"

cur=3
des='Matches ab followed by zero or more c'
declare -a com=(
	'abc*'
)
regexdw_block "$1" "${cur}" "${des}" "${com}"

cur=4
des='Matches ab followed by one or more c'
declare -a com=(
	'abc+'
)
regexdw_block "$1" "${cur}" "${des}" "${com}"

cur=5
des='Matches ab followed by zero or one c'
declare -a com=(
	'abc?'
)
regexdw_block "$1" "${cur}" "${des}" "${com}"

cur=6
des='Matches ab followed by 2 c'
declare -a com=(
	'abc{2}'
)
regexdw_block "$1" "${cur}" "${des}" "${com}"

cur=7
des='Matches ab followed by 2 or more c'
declare -a com=(
	'abc{2,}'
)
regexdw_block "$1" "${cur}" "${des}" "${com}"

cur=8
des='Matches ab followed by 2 up to 5 c'
declare -a com=(
	'abc{2,5}'
)
regexdw_block "$1" "${cur}" "${des}" "${com}"

cur=9
des='Matches a followed by zero or more copies of the sequence bc'
declare -a com=(
	'a(bc)*'
)
regexdw_block "$1" "${cur}" "${des}" "${com}"

cur=10
des='Matches a followed by 2 up to 5 copies of the sequence bc'
declare -a com=(
	'a(bc){2,5}'
)
regexdw_block "$1" "${cur}" "${des}" "${com}"

cur=11
des='Matches a followed by b or c and captures b or c'
declare -a com=(
	'a(b|c)'
)
regexdw_block "$1" "${cur}" "${des}" "${com}"

cur=12
des='Matches a followed by b or c but without capturing b or c'
declare -a com=(
	'a[bc]'
)
regexdw_block "$1" "${cur}" "${des}" "${com}"

cur=13
des='Matches single character that is a digit'
declare -a com=(
	'\d'
)
regexdw_block "$1" "${cur}" "${des}" "${com}"

cur=14
des='Matches a word character (alphanumeric character plus underscore)'
declare -a com=(
	'\w'
)
regexdw_block "$1" "${cur}" "${des}" "${com}"

cur=15
des='Matches a whitespace character (includes tabs and line breaks)'
declare -a com=(
	'\s'
)
regexdw_block "$1" "${cur}" "${des}" "${com}"

cur=16
des='Matches any character'
declare -a com=(
	'.'
)
regexdw_block "$1" "${cur}" "${des}" "${com}"

cur=17
des='Matches a single non-digit character'
declare -a com=(
	'\D'
)
regexdw_block "$1" "${cur}" "${des}" "${com}"

cur=18
des='Matches $ before one digit'
declare -a com=(
	'\$\d'
)
regexdw_block "$1" "${cur}" "${des}" "${com}"

cur=19
des='Flag: does not return after the first match, restarting the subsequent searches from the end of the previous match'
declare -a com=(
	'\^abc\g'
)
regexdw_block "$1" "${cur}" "${des}" "${com}"

cur=20
des='Flag: when enabled ^ and $ will match the start and end of a line, instead of the whole string'
declare -a com=(
	'\^abc xyz$\gm'
)
regexdw_block "$1" "${cur}" "${des}" "${com}"

cur=21
des='Flag: makes the whole expression case-insensitive'
declare -a com=(
	'\aBc\i'
)
regexdw_block "$1" "${cur}" "${des}" "${com}"

cur=22
des='Grouping and capturing: parentheses create a capturing group with value bc'
declare -a com=(
	'a(bc)'
)
regexdw_block "$1" "${cur}" "${des}" "${com}"

cur=23
des='Grouping and capturing: using ?: we disable the capturing group'
declare -a com=(
	'a(?:bc)*'
)
regexdw_block "$1" "${cur}" "${des}" "${com}"

cur=24
des='Grouping and capturing: using ?<foo> we put a name to the group with a word have a-z'
declare -a com=(
	'a(?<foo>[a-z]+])'
)
regexdw_block "$1" "${cur}" "${des}" "${com}"

cur=25
des='Bracket expressions: negate a search, not a letter from a to z or from A to Z'
declare -a com=(
	'[^a-zA-Z]'
)
regexdw_block "$1" "${cur}" "${des}" "${com}"
}














