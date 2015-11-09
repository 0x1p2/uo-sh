#!/bin/bash
clear

# Variables
usrcd=`pwd`
fn="jic.tar.gz"
fno="jic.tar.gz"
i=0

# Functions
function checkamount {
 for item in *
  do
   i=$[ $i + 1 ]
 done
}


cd ../../

if [[ $1 == "" ]]; then
 echo -e "\n\n[ \033[1;31m**\033[m ]  Current directory: $usrcd"
 echo -en "[ \033[1;31m**\033[m ]  Date: "
 read usrdate
else
 usrdate=$1
fi
 
echo -en "[ \033[32mOK\033[m ]  "
if [[ -d backups/$usrdate ]]; then
 echo -e "Directory already exists."
else 
 mkdir -v backups/$usrdate
fi
 

echo -e "[ \033[1;31m**\033[m ]  Packaging files: "
tar -cvzf $fn uo/ultima.sh uo/functions/ uo/docs/ uo/misc/
echo -en "\n[ \033[32mOK\033[m ]  File packaging complete.\n[ \033[1;31m**\033[m ]  Moving files: \n[ \033[1;31m**\033[m ]  "
cd backups/$usrdate
if [[ -f $fn ]]; then
 checkamount
 mv -v ../../$fn jic${i}.tar.gz
 fn="backups/$usrdate/jic${i}.tar.gz"
else
 mv -v ../../$fn .
 fn="backups/$usrdate/$fn"
fi
cd ../../
echo -e "[ \033[32mOK\033[m ]  File move complete."

echo -en "[ \033[32mOK\033[m ]  Copying to home directory.\n[ \033[1;31m**\033[m ]  "
cp -rv $fn ~/backups/$fno
echo -e "[ \033[32mOK\033[m ]  File copy complete.\n"
