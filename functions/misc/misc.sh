#!/bin/bash

if [[ ${sourced_misc} != 1 ]]; then
	source misc/source.sh
	source misc/authenticate.sh
	source misc/createplayer.sh
	source misc/paperdoll.sh
	source misc/optionsmenu.sh
	source misc/save.sh
	source misc/setzero.sh
	source misc/armorset.sh
	source misc/readme/home.sh
	source locations/britannia/towncenter.sh
	source combat/combatstage.sh
	sourced_misc=1
fi


function randomgen {
 randnum=$(($RANDOM%200 + 1))
 echo $randnum
}


function pause() {
 echo " "
 read -sn 1 -p "Press any key to continue..."
 echo " "
}


function screwup {
 clear
 echo " "
 echo -e " [\\033[1;33m-\\033[m]  You screwed up somewhere, try again. "
 echo " "
 pause
 clear
}


function quitgame {
 clear
 echo " "
 echo -en " Are you sure you wish to quit?
  Option [y/n]: "
 read optyn
 if [[ $optyn = y || $optyn = Y ]]; then
  echo " "
  quitexit=1
  saveprofile
  clear
  echo " "
  echo " Thank you for playing."
  sleep 1
  pause
  clear && exit 0
 fi
}


function game.credits {
 clear
 echo " "
 echo -e " Created by:
  Schism || 0x1p2.

Special Thanks to:
Michael Nolan
Cristian Habib"
 pause
 player.classmenu
}


function bandaid {

 source classes/$player_source
 source skills/healing.sh
 source skills/anatomy.sh

 player.statmod

 skill_anatomy=$[ $player_skill_anatomy / 9 ]
 bandaidhp=`echo $((($player_hp_modifier_increase / 6) + ($player_skill_healing / 2) + $skill_anatomy))`

 echo " "
 echo -en " [\\033[1;36m+\\033[m]  How many bandages do you wish to apply? [#]: "
 read bandnum
 if [[ $bandnum -eq " " ]]; then
  bandnum=0
 elif [[ $bandnum -gt $player_item_bandaid ]]; then
  echo -e " [\\033[1;33m-\\033[m]  You do not have enough bandaids to do that."
  pause
 elif [[ $bandnum -gt 3 ]]; then
  echo -e " [\\033[1;33m-\\033[m]  You cannot apply more than 3 bandaids."
  pause
 else
  player_hp=$[ $bandnum * $bandaidhp + $skill_anatomy + $player_hp ]
  skillgain.healing
  skillgain.anatomy
  if [[ $player_hp -gt $player_hp_modifier_increase ]]; then
   player_item_bandaid=$[ $player_item_bandaid - $bandnum ]
   hpoverheal=$[ $player_hp - $player_hp_modifier_increase ]
   player_hp=$player_hp_modifier_increase
   echo -e " [\\033[1;36m+\\033[m]  Your HP is now \\033[1;32m$player_hp\033[m / \\033[1;32m$player_hp_modifier_increase\\033[m.
       You overhealed by: \\033[1;32m$hpoverheal\\033[m."
   pause
  else
   hpincrease=$[ $bandnum * $bandaidhp ]
   player_item_bandaid=$[ $player_item_bandaid - $bandnum ]
   echo -e " [\\033[1;36m+\\033[m]  Your HP is now \\033[1;32m$player_hp\\033[m. Increased by: \\033[1;32m$hpincrease\\033[m"
   pause
  fi
 fi
}
