#!/bin/bash
cd ..
echo -en "Current word: "
read f_word

echo -en "Second  word: "
read s_word

if [[ ${f_word} == "" ]]; then
	echo "First word not supplied..."
	exit
elif [[ ${s_word} == "" ]]; then
	echo "Second word not supplied..."
	exit
fi

find . -type f -print0 | xargs -0 sed -i "s/$f_word/$s_word/g"
