#!/bin/bash

dwcurl () {

curldw_output

echo -e "\n\nEnter Input: " && read input && echo -e "\n"

curldw_output $input

unset input
}

curldw_block () {

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

curldw_output () {

if [ -z "$1" ] 
then
	echo -e 'dwcurl:input\n'
else
	echo -e 'dwcurl:help\n'
fi

cur=1

des='Simple usage'
declare -a com=(
	'curl https://www.example.com/'
	'curl ftp://ftp.funet.fi/README'
)
curldw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='Downloading Files: -o for providing file name, -O to save with server filename'
declare -a com=(
	'curl -o vlc.dmg http://ftp.belnet.be/mirror/videolan/vlc/3.0.4/macosx/vlc-3.0.4.dmg'
	'curl -O http://ftp.belnet.be/mirror/videolan/vlc/3.0.4/macosx/vlc-3.0.4.dmg'
)
curldw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='Following Redirects: Use option -L for following 3XX redirects'
declare -a com=(
	'curl -L http://www.instagram.com/'
)
curldw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='Viewing Response Headers: use -i'
declare -a com=(
	'curl -i https://www.instagram.com/'
)
curldw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='View Request Headers and Connection Information: use -v and -vo /dev/null for no body and -svo /dev/null for removing progress bar and '
declare -a com=(
	'curl -v https://www.atatus.com/'
	'curl -vo /dev/null https://www.atatus.com/'
	'curl -svo /dev/null https://www.atatus.com/'
)
curldw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='Setting HTTP Request Headers: -H'
declare -a com=(
	'curl -H "X-My-Custom-Header: 123" https://httpbin.org/get'
	'httpbin.org is a very helpful website that allows you to see the specifics of each HTTP request youve made to it.'
)
curldw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='Make POST Requests, with url encode, form data through a file, send a file, json data'
declare -a com=(
	'curl -X POST --data "firstname=atatus" https://httpbin.org/post'
	'curl --data "firstname=atatus" https://httpbin.org/post'
	'curl --data-urlencode "email=test@example.com" --data-urlencode "name=atatus" https://httpbin.org/post'
	'curl --data @params.txt example.com'
	'curl -F file=@test.c https://httpbin.org/post'
	'curl --data @data.json https://httpbin.org/post'
)
curldw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='For styled output on headers'
declare -a com=(
	'curl -I --styled-output example.com'
)
curldw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='Making cURL Fail on HTTP Errors: -fsSo'
declare -a com=(
	'curl https://www.atatus.com/404 -fsSo file.txt'
)
curldw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='Make Authenticated Requests: -u'
declare -a com=(
	'curl -u atatus:@t@tus https://example.com/'
	'curl https://atatus:@t@tus@example.com/'
)
curldw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='Testing Protocol Support like tls or ssl'
declare -a com=(
	'curl -v --tlsv1.2 https://www.atatus.com/'
	'curl -v --sslv3 https://www.atatus.com/'
)
curldw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='Disabling cURL’s Certificate Checks: -k'
declare -a com=(
	'curl -k https://expired.badssl.com/'
)
curldw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='Curl config file'
declare -a com=(
	'vim ~/.curlrc'
)
curldw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='Route through a DNS server'
declare -a com=(
	'curl --dns-servers 8.8.8.8 http://www.example.com/'
)
curldw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='cURL Configuration Files'
declare -a com=(
	'curl -K ~/.curlrc example.com'
)
curldw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='Add connect time out to request'
declare -a com=(
	'curl --connect-timeout 20 https://example.com'
)
curldw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='Write all cookies after a completed operation to file'
declare -a com=(
	'curl -c store-here.txt https://example.com'
	'curl -cookie-jar store-here.txt https://example.com'
)
curldw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='Pass cookies as header when making a request'
declare -a com=(
	'curl -b cookiefile https://example.com'
)
curldw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='Write and pass cokkies'
declare -a com=(
	'curl -b cookiefile -c cookiefile https://example.com'
)
curldw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des=''
declare -a com=(
	''
)
curldw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))



}














