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

des='Display Files of a Specific Filesystem'
declare -a com=(
	'sudo lsof /sys/'
)
lsofdw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='Print Terminal Files'
declare -a com=(
	'lsof /dev/tty*'
)
lsofdw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='Show All Files Accessed by a User or not'
declare -a com=(
	'sudo lsof -u <<username>>'
	'sudo lsof -u ^<<username>>'
)
lsofdw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='Display Files Used by a Process name'
declare -a com=(
	'sudo lsof -c <<process>>'
)
lsofdw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='Print Files Opened by a Specific PID 2. Add a not 3. By the parent ID'
declare -a com=(
	'sudo lsof -p <<PID_ID>>'
	'sudo lsof -p ^<<PID_ID>>'
	'sudo lsof -p <<PID_ID>> -R'
)
lsofdw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='Files Under a Directory 2. without recursion'
declare -a com=(
	'sudo lsof +D <<DIR_PATH>>'
	'sudo lsof +d <<DIR_PATH>>'
)
lsofdw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='Files by Network Connections 1. IP4 2. IP6'
declare -a com=(
	'sudo lsof -i'
	'sudo lsof -i 4'
	'sudo lsof -i 6'
)
lsofdw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='Files by Network Connections type tcp or udp'
declare -a com=(
	'sudo lsof -i tcp'
	'sudo lsof -i udp'
)
lsofdw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='Files by 1. port number 2. protocol name 3. connection type 4. Port range'
declare -a com=(
	'sudo lsof -i :<<22_SSH_PORT>>'
	'sudo lsof -i :<<ssh_PROTOCOL_NAME>>'
	'sudo lsof -i tcp:<<ssh_PROTOCOL_NAME>>'
	'sudo lsof -i tcp:<<6032-6040_PORT_RANGE>>'
)
lsofdw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='Filter with AND, all internet files for user: -a'
declare -a com=(
	'sudo lsof -i -a -u <<USER_NAME>>'
)
lsofdw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='Find a process which is accessing a file 1. Find the process ids 2. get info on process ids'
declare -a com=(
	'lsof -t <<FILE_PATH>>'
	'ps -ef | grep -E "<<PROCESS_IDS>>"'
)
lsofdw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des=''
declare -a com=(
	''
)
lsofdw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

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














