#!/bin/bash

dwfind () {

finddw_output

echo -e '\nSimple usage: find <<folder-path>> -name <<file-name>>'

echo -e "\n\nEnter Input: " && read input && echo -e "\n"

finddw_output $input

unset input
}

finddw_block () {

if [ -z "$1" ] || [ "$1" = "$2" ] || [ "$1" = "a" ]
then
	echo -E "$2. $3"
fi
if [ "$1" = "$2" ] || [ "$1" = "a" ]
then
	echo -E 'eg.'
	echo -E $4
	for value in "${com[@]}"; 
	do 
	     echo "$value"; 
	done
	echo
fi
}

findarraydw_block () {

if [ -z "$1" ] || [ "$1" = "$2" ] || [ "$1" = "a" ]
then
	echo -E "$2. $3"
fi
if [ "$1" = "$2" ] || [ "$1" = "a" ]
then
	echo -E 'eg.'
	for value in "${com[@]}"; 
	do 
	     echo "$value"; 
	done
	echo
fi
}

finddw_output () {

if [ -z "$1" ] 
then
	echo -e 'dwfind:input\n'
else
	echo -e 'dwfind:help\n'
fi

cur=1
des='File search ignore case'
declare -a com=(
	'find <<folder-path>> -iname <<file-name>>'
)
findarraydw_block "$1" "${cur}" "${des}" ${com}

cur=2
des='Find Directories Using Name'
declare -a com=(
	'find <<folder-path>> -type d -name <<file-name>>'
)
findarraydw_block "$1" "${cur}" "${des}" ${com}

cur=3
des='Find files Using Name'
declare -a com=(
	'find <<folder-path>> -type f -name <<file-name>>'
)
findarraydw_block "$1" "${cur}" "${des}" ${com}

cur=4
des='Regex'
declare -a com=(
	'find <<folder-path>> -type f -name "<<file-name>>*"'
)
findarraydw_block "$1" "${cur}" "${des}" ${com}

cur=5
des='Find Files With 777 Permissions'
declare -a com=(
	'find <<folder-path>> -type f -perm 0777'
)
findarraydw_block "$1" "${cur}" "${des}" ${com}

cur=6
des='Find Files Without 777 Permissions'
declare -a com=(
	'find <<folder-path>> -type f ! -perm 777'
)
findarraydw_block "$1" "${cur}" "${des}" ${com}

cur=7
des='Find Read-Only Files'
declare -a com=(
	'find <<folder-path>> -perm /u=r'
)
findarraydw_block "$1" "${cur}" "${des}" ${com}

cur=8
des='Find Executable Files'
declare -a com=(
	'find <<folder-path>> -perm /a=x'
)
findarraydw_block "$1" "${cur}" "${des}" ${com}


cur=9
des='Find all Empty Files'
declare -a com=(
	'find <<folder-path>> -type f -name <<reg-x*>> -exec rm -f {} \' 
	'find <<folder-path>> -type f -name <<reg-x*>> | xargs rm'
)
findarraydw_block "$1" "${cur}" "${des}" ${com}

cur=10
des='Find all Empty Files'
com='find <<folder-path>> -type f -empty'
finddw_block "$1" "${cur}" "${des}" "${com}"

cur=11
des='Find all Empty Directories'
com='find <<folder-path>> -type d -empty'
finddw_block "$1" "${cur}" "${des}" "${com}"

cur=12
des='Find all Hidden Files'
com='find <<folder-path>> -type f -name ".*"'
finddw_block "$1" "${cur}" "${des}" "${com}"

cur=13
des='Find Single File Based on User'
com='find <<folder-path>> -user root -name <<file-name>>'
finddw_block "$1" "${cur}" "${des}" "${com}"

cur=14
des='Find all Files Based on User'
com='find <<folder-path>> -user root'
finddw_block "$1" "${cur}" "${des}" "${com}"

cur=15
des='Find all Files Based on Group'
com='find <<folder-path>> -group <<group-name>>'
finddw_block "$1" "${cur}" "${des}" "${com}"

cur=16
des='Find Last 50 Days Modified Files'
com='find <<folder-path>> -mtime 50'
finddw_block "$1" "${cur}" "${des}" "${com}"

cur=17
des='Find Last 50 Days Accessed Files'
com='find <<folder-path>> -atime 50'
finddw_block "$1" "${cur}" "${des}" "${com}"

cur=18
des='Find Last 50-100 Days Modified Files'
com='find <<folder-path>> -mtime +50 –mtime -100'
finddw_block "$1" "${cur}" "${des}" "${com}"

cur=19
des='Find Changed Files in Last 1 Hour'
com='find <<folder-path>> -cmin -60'
finddw_block "$1" "${cur}" "${des}" "${com}"

cur=20
des='Find Modified Files in Last 1 Hour'
com='find <<folder-path>> -mmin -60'
finddw_block "$1" "${cur}" "${des}" "${com}"


cur=21
des='Find Accessed Files in Last 1 Hour'
com='find <<folder-path>> -amin -60'
finddw_block "$1" "${cur}" "${des}" "${com}"


cur=22
des='Find 50MB Files'
com='find <<folder-path>> -size 50M'
finddw_block "$1" "${cur}" "${des}" "${com}"


cur=23
des='Find Size between 50MB – 100MB'
com='find <<folder-path>> -size +50M -size -100M'
finddw_block "$1" "${cur}" "${des}" "${com}"



unset cur des com
}














