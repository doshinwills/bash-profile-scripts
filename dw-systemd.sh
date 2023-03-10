#!/bin/bash

dwsystemd () {

systemddw_output

echo -e "\n\nEnter Input: " && read input && echo -e "\n"

systemddw_output $input

unset input
}

systemddw_block () {

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

systemddw_output () {

if [ -z "$1" ] 
then
	echo -e 'dwsystemd:input\n\n'
  echo -e "Innit system. \nManages how process come up when you start a machine. \nManages how to start stop and restart process. \nSystemctl is the command to connect to systemd\n"
  echo -e "The service command is a wrapper script that allows system administrators to start, stop, and check the status of services without worrying too much about the actual init system being used. Prior to systemd's introduction, it was a wrapper for /etc/init.d scripts and Upstart's initctl command, and now it is a wrapper for these two and systemctl as well."
else
	echo -e 'dwsystemd:help\n'
fi

cur=1

des='Check which init system in use'
declare -a com=(
	'{ ls -l /proc/1/fd |grep -q systemd && echo "init: systemd"; } || \'
	'{ ls -l /proc/1/fd |grep -q /run/initctl && echo "init: sysvinit"; } || \'
	'{ ls -l /proc/1/fd |grep -q upstart && echo "init: upstart"; } || \'
	'{ ls -l /proc/1/exe |grep -q busybox && echo "init: busybox"; } || \'
	'{ ps 1 |grep -q launchd && echo "init: launchd"; } || \'
	'echo "unknown init"'
)
systemddw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='List all the process(units)'
declare -a com=(
	'systemctl list-units'
)
systemddw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='Status start stop restart and reload a service'
declare -a com=(
	'systemctl status sshd.service'
	'systemctl start sshd.service'
	'systemctl stop sshd.service'
	'systemctl restart sshd.service'
	'systemctl reload sshd.service'
)
systemddw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='Enable disable at the loadup'
declare -a com=(
	'systemctl enable sshd.service'
	'systemctl enable sshd.service'
)
systemddw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='See failed service'
declare -a com=(
	'systemctl --failed'
)
systemddw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='Is a service enabled'
declare -a com=(
	'systemctl is-enabled sshd.service'
)
systemddw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='System functions, 1.Reboot 2.Poweroff 3.Suspend'
declare -a com=(
	'systemctl reboot'
	'systemctl poweroff'
	'systemctl suspend'
)
systemddw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='See the logs of service'
declare -a com=(
	'sudo journalctl -u sshd'
)
systemddw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))
}














