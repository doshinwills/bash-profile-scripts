#!/bin/bash

dwnc () {

ncdw_output

echo -e "\n\nEnter Input: " && read input && echo -e "\n"

ncdw_output $input

unset input
}

ncdw_block () {

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

ncdw_output () {

if [ -z "$1" ] 
then
	echo -e 'dwnc:input\n'
else
	echo -e 'dwnc:help\n'
fi

cur=1

des='Scan port in remote system'
declare -a com=(
	'nc -v <<IP-ADDRESS>> 22'
	'nc -v <<URL>> 22'
)
ncdw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='Know what process is running in remote server'
declare -a com=(
	'nc <<HOST-CNAME-OR-IP-ADD>>  22'
	'nc <<HOST-CNAME>>  22'
)
ncdw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='Send a file'
declare -a com=(
	'Client: nc -l -p <<PORT-NUMBER>> > <<FILE-NAME>>'
	'Server: nc -w 100 <<HOST-URL-OR-IP>> < <<FILE-NAME>>'
	'Client with file transfer status: netcat -l <<PORT-NUMBER>> | pv > <<FILE-NAME>>'

)
ncdw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='Create a Command Line Chat Server'
declare -a com=(
	'Server: nc -l -vv -p <<PORT-NUMBER>>'
	'Client: nc <<HOST-URL-OR-IP>> <<PORT-NUMBER>>'
)
ncdw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='Create a Basic Web Server'
declare -a com=(
	'Step 1: vim index.html'
	'Step 2: while : ; do ( echo -ne "HTTP/1.1 200 OK\r\n" ; cat index.html; ) | nc -l -p <<PORT-NUMBER>> ; done'
)
ncdw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='Make an HTTP call'
declare -a com=(
	'printf "GET / HTTP/1.0\r\n\r\n" | nc <<URL>> 80'
)
ncdw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

}














