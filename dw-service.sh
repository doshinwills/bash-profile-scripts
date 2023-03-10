#!/bin/bash

dwservice () {

servicedw_output

echo -e "\n\nEnter Input: " && read input && echo -e "\n"

servicedw_output $input

unset input
}

servicedw_block () {

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

servicedw_output () {

if [ -z "$1" ] 
then
	echo -e 'dwservice:input\n\n'
	echo -e "The service command is a wrapper script that allows system administrators to start, stop, and check the status of services without worrying too much about the actual init system being used. Prior to systemd's introduction, it was a wrapper for /etc/init.d scripts and Upstart's initctl command, and now it is a wrapper for these two and systemctl as well."
else
	echo -e 'dwservice:help\n'
fi



cur=1

des='Status start stop restart and reload a service'
declare -a com=(
	'service sshd status'
	'service sshd start'
	'service sshd stop'
	'service sshd restart'
	'service sshd reload'
)
servicedw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='Enable disable at the loadup'
declare -a com=(
	'chkconfig sshd on'
	'chkconfig sshd off'
)
servicedw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='Check all service running '
declare -a com=(
	'service --status-all'
)
servicedw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

}














