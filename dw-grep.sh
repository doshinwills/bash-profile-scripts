#!/bin/bash

export GREP_OPTIONS='--color=auto' GREP_COLOR='100;8'

dwgrep () {

grepdw_input

echo -e "\n\nEnter Input: " && read input && echo -e "\n"

grepdw_help $input

unset input

}

grepdw_help () {


echo -e 'help:dwgrep'

if [ "$1" = "1" ] || [ "$1" = "a" ]
then
	echo -e '\n# Case insensitive '
	echo -e 'eg. grep -i "<<search_pattern>>" .'
fi

if [ "$1" = "2" ] || [ "$1" = "a" ]
then
	echo -e '\n# Recursive '
	echo -e 'eg. grep -r "<<search_pattern>>" .'
fi

if [ "$1" = "3" ] || [ "$1" = "a" ]
then
	echo -e '\n# Recursive with soft links '
	echo -e 'eg. grep -R "<<search_pattern>>" .'

fi

if [ "$1" = "4" ] || [ "$1" = "a" ]
then
	echo -e '\n# Match multiple patterns : OR search '
	echo -e 'eg. grep -e "<<search_pattern_1>>" -e "<<search_pattern_2>>" .'
	echo -E 'grep -E "<<search_pattern_1>>|<<search_pattern_2>>" .'
	echo -E 'grep "<<search_pattern_1>>\|<<search_pattern_2>>" .'
	echo -E 'egrep "<<search_pattern_1>>|<<search_pattern_2>>" .'
fi

if [ "$1" = "5" ] || [ "$1" = "a" ]
then
	echo -e '\n# Match exact word '
	echo -e 'eg. grep -w "<<search_pattern>>" .'
fi

if [ "$1" = "6" ] || [ "$1" = "a" ]
then
	echo -e '\n# Display N lines after match '
	echo -e 'eg. grep -C 1 "<<search_pattern>>" .'
fi

if [ "$1" = "7" ] || [ "$1" = "a" ]
then
	echo -e '\n# Invert match '
	echo -e 'eg. grep -v "<<search_pattern>>" .'
fi

if [ "$1" = "8" ] || [ "$1" = "a" ]
then
	echo -e '\n# Invert match with multiple patterns '
	echo -e 'eg. grep -v -e "<<search_pattern_1>>" -e "<<search_pattern_2>>" .'
fi

if [ "$1" = "9" ] || [ "$1" = "a" ]
then
	echo -e '\n# Count matches '
	echo -e 'eg. grep -c "<<search_pattern_1>>" .'
fi

if [ "$1" = "10" ] || [ "$1" = "a" ]
then
	echo -e '\n# Disply only filenames '
	echo -e 'eg. grep -l "<<search_pattern_1>>" .'
fi

if [ "$1" = "11" ] || [ "$1" = "a" ]
then
	echo -e '\n# Disply line numbers '
	echo -e 'eg. grep -n "<<search_pattern_1>>" .'
fi

if [ "$1" = "12" ] || [ "$1" = "a" ]
then
	echo -e '\n# Include only certain type of files '
	echo -e 'eg. grep -r --include="<<file_pattern_1>>" --include="<<file_pattern_2>>" "<<search_pattern>>" .'
fi

if [ "$1" = "13" ] || [ "$1" = "a" ]
then
	echo -e '\n# Exclude only certain type of files '
	echo -e 'eg. grep -r --exclude="<<file_pattern_1>>" --exclude="<<file_pattern_2>>" "<<search_pattern>>" .'
fi

if [ "$1" = "14" ] || [ "$1" = "a" ]
then
	echo -e '\n# AND search: Both pattens on the line'
	echo -E 'eg. grep -E "<<search_pattern_1>>.*<<search_pattern_1>>" .'
	echo -E 'egrep -r "<<search_pattern_1>>.*<<search_pattern_1>>" .'
fi

if [ "$1" = "15" ] || [ "$1" = "a" ]
then
	echo -e '\n# AND OR search: Both pattens on the line with multiple patterns'
	echo -E 'eg. grep -E "<<search_pattern_1>>.*<<search_pattern_2>>|<<search_pattern_3>>.*<<search_pattern_4>>" .'
	echo -E 'egrep -r "<<search_pattern_1>>.*<<search_pattern_2>>|<<search_pattern_3>>.*<<search_pattern_4>>" .'

fi
}

grepdw_input () {
echo 'grepdw:input
1. Case insensitive search
2. Recursive search
3. Recursive with soft links
4. Match multiple patterns : OR search
5. Match exact word
6. Display N lines arround match
7. Invert matching
8. Invert match with multiple patterns
9. Count matches
10. Disply only filenames
11. Disply line numbers
12. Include only certain type of files
13. Exclude only certain type of files
14. AND search: Both pattens on the line
15. AND OR search: Both pattens on the line with multiple patterns'
}