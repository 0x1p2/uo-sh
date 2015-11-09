#!/bin/bash

function authenticate {
 clear
 echo " "
 echo -en " Type in your Player's name: "
 read player_name
 if [[ -f "${player_name}"/configs ]]; then
  player.source
  storedpass=`cat profiles/"${player_name}"/configurations | grep "${player_name}" | cut -d':' -f3`
  clear
  echo " "
  echo -en " Enter your password: "
  read -s pass
  pass=`echo "$pass" | sha1sum | awk '{print $1}'`
  if [[ "$pass" == "$storedpass" ]]; then
   clear
   echo " "
   echo " Authentication successful."
   pause
   confirm.player
  else
   echo " Authentication failed."
   pause
   clear && exit 1
  fi
 else
  clear
  echo " "
  echo -en " Account not created. 
  Type in your password for your new account: "
  read -s pass1
  storedpass1=`echo "$pass1" | sha1sum | awk '{print $1}'`
  echo -en "Type in your password again: "
  read -s pass2
  storedpass2=`echo "$pass2" | sha1sum | awk '{print $1}'`
  if [[ "$storedpass1" == "$storedpass2" ]]; then
   storedpass="$storedpass2"
   clear
   echo " Account created. Continuing to character selection."
   pause
   player.classmenu
  else
   echo " "
   echo " The passwords did not match. Please try again. "
   pause
   authenticate
  fi
 fi
}

function script.start {
 clear
 echo " "
 echo -e " [\033[31m-\033[m] Checking if profile directory exists..."
 sleep 1
 if [[ -d profiles/ ]]; then
  chmod -R 755 profiles/
  echo -e " [\033[1;36m+\033[m] Profile directory does exist. Populating character list..."
  ls -al profiles/ | grep .conf | tr -s ' ' '*' | cut -d'*' -f9 | cut -d '.' -f1 > profiles/.charlist.txt
  echo " "
  echo -e " [\033[1;36m+\033[m] Character list updated!"
 else
  echo -e " [\033[31m-\033[m] Profile directory does not exist. Creating..." 
  mkdir profiles
  chmod 755 profiles/
  echo -e " [\033[1;36m+\033[m] Profile directory created! Populating character list..."
  ls -al profiles/ | grep .conf | tr -s ' ' '*' | cut -d'*' -f9 | cut -d '.' -f1 > profiles/.charlist.txt
  echo " "
  echo -e " [\033[1;36m+\033[m] Character list updated!"
 fi
 sleep 2 
 clear
 echo -e " \\033[1;36m
 Uu Uu  Ll  TTTTTTTt Ii MMm    MMm   AAa
 Uu Uu  Ll     Tt    Ii MmMm  MmMm  Aa Aa
 Uu Uu  Ll     Tt    Ii Mm MmMm Mm AAAAAAa 
 UUUUu  LlLlLl Tt    Ii Mm  Mm  Mm Aa   Aa\\033[m"
 sleep 2
 clear
 if [[ "${player_name}" != "" ]]; then
  player_name="${player_name}"
 else
  echo " "
  echo -en " Enter your adventurers' name: " 
  read player_name 
 fi
 if [[ -f profiles/"${player_name}"/configs ]]; then
  echo -e " "
  echo -en " Your character already exists. Whould you like to
  load the profile [yes]: "
  read -t 2 yesno
  if [[ $yesno == "Yes" || $yesno == "yes" || $yesno == "" || $yesno == "y" || $yesno == "Y" ]]; then
   player.source
   echo -e "\n [\033[1;36m+\033[m]  Loading profile..."
   sleep 2
   britannia.towncenter
  elif [[ $yesno == "no" || $yesno == "n" || $yesno == "No" ]]; then
   rm -rf profiles/"${player_name}"/ 
   player.classmenu
  else
   echo -e " \033[1;31m-\033[m]  Invalid choice... returning to top."
   script.start
  fi
 else
  player.classmenu
 fi
}
