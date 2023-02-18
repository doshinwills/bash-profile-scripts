#!/bin/bash

dwvim () {

vimdw_output

echo -e "\n\nEnter Input: " && read input && echo -e "\n"

vimdw_output $input

unset input
}

vimdw_block () {

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

vimdw_output () {

if [ -z "$1" ] 
then
	echo -e 'dwvim:input\n'
else
	echo -e 'dwvim:help\n'
fi

cur=1

des='Cursor Movements on file'
declare -a com=(
	'Start of the file: gg'
	'End of the file: G'
	'Goto a 85th line: :85'
)
vimdw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='Cursor Movements on screen'
declare -a com=(
	'Top of the screen: H'
	'Middle of the screen: M'
	'Bottom of the screen: L'
)
vimdw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='Cursor Movements along words and line'
declare -a com=(
	'Start of a next word: w'
	'End of next word: e'
	'Start of the line: 0 or ^'
	'End of the line: $'
)
vimdw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='Page movements'
declare -a com=(
  'Moving one fullscreen forward: Ctrl + b, half screen: Ctrl + d'
  'Moving one fullscreen backward: Ctrl + f, half screen: Ctrl + u'
	'Moving the screen down by one line without the use of a cursor: Ctrl + e'
	'Moving the screen up by one line without making use of the cursor: Ctrl + y'
)
vimdw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='Insert mode'
declare -a com=(
	'Inserting at the beginning of a line: I'
	'Inserting at the end of the line: A'
	'Opening new lines above the selected line: O'
	'Opening new lines below the selected line: o'
)
vimdw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='Cut, copy, paste and delete'
declare -a com=(
	'Copy a line: yy'
	'Copy 5 lines: 5yy'
	'Paste from clipboard after the cursor position: p'
	'Cut or delete a line: dd'
  'Cut or delete five lines: 5dd'
  'Cut or delete the characters of the word selected from the cursor '
  'Cut or deleting text to the end of line: D'
)
vimdw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='Editing'
declare -a com=(
  'Undo: u'
	'Replacing only one character: r'
	'Replacing more a single characters: R'
)
vimdw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='Search and replace'
declare -a com=(
	'Quickly search patterns: /pattern'
	'Quickly search backward for a pattern: ?pattern'
	'Repeating search in a similar direction: n'
	'Repeating searches in different directions: N'
	'Replacing old contents with the new ones all over the file: %s/old/new/g'
	'Replacing old contents with the new ones all over the file: s/old/new/g'
)
vimdw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))

des='Options'
declare -a com=(
	'Line numbers: :set nu; turn off: :set nonu'
	'Relative line numbers: :set rnu; turn off: :set nornu'
	'Syntax: :syntax on'
	'Color schema: :colo desert'
	'Mouse: :set mouse=a'
	'Cursor Line: :set cursorline'
	'Cursor Column: :set cursorcolumn'
	'No wraping: :set nowrap'
	'Best option to run: :set nu mouse=a cursorline :colo desert :syntax on'
)
vimdw_block "$1" "${cur}" "${des}" "${com}"
cur=$((cur+1))
}
