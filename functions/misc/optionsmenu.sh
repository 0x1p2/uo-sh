#!/bin/bash

#!/bin/bash

function optionsmenu {
 clear
 echo " "
 echo -e " [\\033[1;36m+\\033[m]  Select your option: "
 echo " "
 select menusel in "Modify Auto-Attack" "Player Lookup" "Save" "Return to Menu"; do
  case $menusel in
   "Modify Auto-Attack")
    modautoatt
    optionsmenu ;;
   "Player Lookup")
    whoisplayer
    optionsmenu ;;
   "Save")
    saveprofile
    optionsmenu ;;
   "Return to Menu")
    clear ;;
   *)
    screwup
    optionsmenu ;;
  esac
  break
 done
}


function modautoatt {
 echo " "
 echo -n " Enter the number of second between auto-attacks: "
 read autospeed
 if [[ $autospeed == "" || $autospeed = 0 ]]; then
  echo " "
  autospeed=$defaultautospeed
  echo -e " [\\033[1;33m+\\033[m]  Your Auto-Attack speed was invalid. Resetting to default [$autospeed seconds]."
 fi
 echo " "
 echo -e " [\\033[1;36m+\\033[m]  Your Auto-Attack speed is: $autospeed seconds."
 pause
}


function whoisplayer {
 clear
 echo " "
 echo -en " Enter the players name you would like to review,
  type playerlist to see a list of current players
  that exist. Type return to go back.

 Choice: "
 read optyn
 if [[ $optyn = "playerlist" ]]; then
  echo " "
  echo -------------------
  more profiles/.charlist.txt
  echo -------------------
  pause
  whoisplayer
 elif [[ $optyn = "return" ]]; then
  optionsmenu
 else
  if [[ -f profiles/$optyn.stats ]]; then
   source profiles/$optyn.stats
   clear
   echo " "
   echo -e "                  ___________________
                 [ Character Profile ]
  +---------------------------------------------------+
  | Character Name: \033[1;37m$charlookupname\\033[m
  | +- Character Class: \\033[32m$charlookupclass\\033[m
  |
  +-[ ATTRIBUTES ]
  | +-- HP: \\033[1;32m$charlookuphp\\033[m\t\tMax HP: \\033[1;32m$charlookupplayer_hp_modifier\\033[m (+\\033[1;32m$charlookupplayer_hp_modifier\\033[
m)
  | +-- Strength: \\033[1;36m$charlookupstr\\033[m\tIntelligence: \\033[1;36m$charlookupint\\033[m
  | +-- Dexterity: \\033[1;36m$charlookupdex\\033[m\tStamina: \\033[1;33m$charlookupstam\\033[m / \\033[1;33m$charlookupstams
tat\\033[m
  |   +-- Attack: \\033[1;31m$charlookuphit\\033[m (+$charlookuphitmod)
  |   +-- Defense: \\033[1;34m$charlookupdef\\033[m (+$charlookupdefmod)
  |
  +-[ ITEM ]
  | +-- Weapon: \\033[36m$charlookupwep\\033[m
  |
  +-[ STATISTICS ]
  | +-- Deaths: $charlookupdeath
  | +-- Kill Count: $lookup_player_killcount
  +---------------------------------------------------+
"
   pause
   whoisplayer
  else
   echo " "
   echo " That player does not exist."
   pause
   whoisplayer
  fi
 fi
}


function statlock {
 clear
 echo " "
 echo -e " $player_stat_primary:\t$player_stat_primary_status
 $player_stat_secondary:\t$player_stat_secondary_status
 $player_stat_triliminary:\t$player_stat_triliminary_status
"
 select menusel in "$player_stat_primary" "$player_stat_secondary" "$player_stat_triliminary" "Return to Inventory"; do
  case $menusel in
   "$player_stat_primary")
    echo " "
    echo -en " Would you like to lock the [$player_stat_primary] skill?
  Option [y/n]: "
    read option
    if [[ $option = y || $option = Y ]]; then
     player_stat_primary_status="locked"
    else
     player_stat_primary_status="open"
    fi
    statlock ;;
   "$player_stat_secondary")
    echo " "
    echo -en " Would you like to lock the [$player_stat_secondary] skill?
  Option [y/n]: "
    read option
    if [[ $option = y || $option = Y ]]; then
     player_stat_secondary_status="locked"
    else
     player_stat_secondary_status="open"
    fi
    statlock ;;
   "$player_stat_triliminary")
    echo " "
    echo -en " Would you like to lock the [$player_stat_triliminary] skill?
  Option [y/n]: "
    read option
    if [[ $option = y || $option = Y ]]; then
     player_stat_triliminary_status="locked"
    else
     player_stat_triliminary_status="open"
    fi
    statlock ;;
   "Return to Inventory")
    clear ;;
   *)
    screwup
    statlock ;;
  esac
 break
 done
}


