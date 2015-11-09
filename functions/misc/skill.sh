#!/bin/bash

function skill.status {
 
 # Fencing
 # Swordsman
 # Mace Fighting
 # Archery
 # Magery
 # Tactics
 # Evaluating Intelligence

 if [[ $player_skill_fencing -lt 20 ]]; then
  player_skill_fencing_bar="\033[1;31m*     \033[m"
 elif [[ $player_skill_fencing -ge 20 && $player_skill_fencing -lt 40 ]]; then
  player_skill_fencing_bar="\033[1;31m**    \033[m"
 elif [[ $player_skill_fencing -ge 40 && $player_skill_fencing -lt 60 ]]; then
  player_skill_fencing_bar="\033[1;31m***   \033[m"
 elif [[ $player_skill_fencing -ge 60 && $player_skill_fencing -lt 80 ]]; then
  player_skill_fencing_bar="\033[1;31m****  \033[m"
 elif [[ $player_skill_fencing -ge 80 && $player_skill_fencing -lt 100 ]]; then
  player_skill_fencing_bar="\033[1;31m***** \033[m"
 elif [[ $player_skill_fencing -ge 100 ]]; then
  player_skill_fencing_bar="\033[1;31m******\033[m"
 fi
 if [[ $player_skill_swordsman -lt 20 ]]; then
  player_skill_swordsman_bar="\033[1;31m*     \033[m"
 elif [[ $player_skill_swordsman -ge 20 && $player_skill_swordsman -lt 40 ]]; then
  player_skill_swordsman_bar="\033[1;31m**    \033[m"
 elif [[ $player_skill_swordsman -ge 40 && $player_skill_swordsman -lt 60 ]]; then
  player_skill_swordsman_bar="\033[1;31m***   \033[m"
 elif [[ $player_skill_swordsman -ge 60 && $player_skill_swordsman -lt 80 ]]; then
  player_skill_swordsman_bar="\033[1;31m****  \033[m"
 elif [[ $player_skill_swordsman -ge 80 && $player_skill_swordsman -lt 100 ]]; then
  player_skill_swordsman_bar="\033[1;31m***** \033[m"
 elif [[ $player_skill_swordsman -ge 100 ]]; then
  player_skill_swordsman_bar="\033[1;31m******\033[m"
 fi
 if [[ $player_skill_macefighting -lt 20 ]]; then
  player_skill_macefighting_bar="\033[1;31m*     \033[m"
 elif [[ $player_skill_macefighting -ge 20 && $player_skill_macefighting -lt 40 ]]; then
  player_skill_macefighting_bar="\033[1;31m**    \033[m"
 elif [[ $player_skill_macefighting -ge 40 && $player_skill_macefighting -lt 60 ]]; then
  player_skill_macefighting_bar="\033[1;31m***   \033[m"
 elif [[ $player_skill_macefighting -ge 60 && $player_skill_macefighting -lt 80 ]]; then
  player_skill_macefighting_bar="\033[1;31m****  \033[m"
 elif [[ $player_skill_macefighting -ge 80 && $player_skill_macefighting -lt 100 ]]; then
  player_skill_macefighting_bar="\033[1;31m***** \033[m"
 elif [[ $player_skill_macefighting -ge 100 ]]; then
  player_skill_macefighting_bar="\033[1;31m******\033[m"
 fi
 if [[ $player_skill_archery -lt 20 ]]; then
  player_skill_archery_bar="\033[1;31m*     \033[m"
 elif [[ $player_skill_archery -ge 20 && $player_skill_archery -lt 40 ]]; then
  player_skill_archery_bar="\033[1;31m**    \033[m"
 elif [[ $player_skill_archery -ge 40 && $player_skill_archery -lt 60 ]]; then
  player_skill_archery_bar="\033[1;31m***   \033[m"
 elif [[ $player_skill_archery -ge 60 && $player_skill_archery -lt 80 ]]; then
  player_skill_archery_bar="\033[1;31m****  \033[m"
 elif [[ $player_skill_archery -ge 80 && $player_skill_archery -lt 100 ]]; then
  player_skill_archery_bar="\033[1;31m***** \033[m"
 elif [[ $player_skill_archery -ge 100 ]]; then
  player_skill_archery_bar="\033[1;31m******\033[m"
 fi
 if [[ $player_skill_magery -lt 20 ]]; then
  player_skill_magery_bar="\033[1;31m*     \033[m"
 elif [[ $player_skill_magery -ge 20 && $player_skill_magery -lt 40 ]]; then
  player_skill_magery_bar="\033[1;31m**    \033[m"
 elif [[ $player_skill_magery -ge 40 && $player_skill_magery -lt 60 ]]; then
  player_skill_magery_bar="\033[1;31m***   \033[m"
 elif [[ $player_skill_magery -ge 60 && $player_skill_magery -lt 80 ]]; then
  player_skill_magery_bar="\033[1;31m****  \033[m"
 elif [[ $player_skill_magery -ge 80 && $player_skill_magery -lt 100 ]]; then
  player_skill_magery_bar="\033[1;31m***** \033[m"
 elif [[ $player_skill_magery -ge 100 ]]; then
  player_skill_magery_bar="\033[1;31m******\033[m"
 fi

 if [[ $player_skill_tactics -lt 20 ]]; then
  player_skill_tactics_bar="\033[1;31m*     \033[m"
 elif [[ $player_skill_tactics -ge 20 && $player_skill_tactics -lt 40 ]]; then
  player_skill_tactics_bar="\033[1;31m**    \033[m"
 elif [[ $player_skill_tactics -ge 40 && $player_skill_tactics -lt 60 ]]; then
  player_skill_tactics_bar="\033[1;31m***   \033[m"
 elif [[ $player_skill_tactics -ge 60 && $player_skill_tactics -lt 80 ]]; then
  player_skill_tactics_bar="\033[1;31m****  \033[m"
 elif [[ $player_skill_tactics -ge 80 && $player_skill_tactics -lt 100 ]]; then
  player_skill_tactics_bar="\033[1;31m***** \033[m"
 elif [[ $player_skill_tactics -ge 100 ]]; then
  player_skill_tactics_bar="\033[1;31m******\033[m"
 fi
 if [[ $player_skill_evalint -lt 20 ]]; then
  player_skill_evalint_bar="\033[1;31m*     \033[m"
 elif [[ $player_skill_evalint -ge 20 && $player_skill_evalint -lt 40 ]]; then
  player_skill_evalint_bar="\033[1;31m**    \033[m"
 elif [[ $player_skill_evalint -ge 40 && $player_skill_evalint -lt 60 ]]; then
  player_skill_evalint_bar="\033[1;31m***   \033[m"
 elif [[ $player_skill_evalint -ge 60 && $player_skill_evalint -lt 80 ]]; then
  player_skill_evalint_bar="\033[1;31m****  \033[m"
 elif [[ $player_skill_evalint -ge 80 && $player_skill_evalint -lt 100 ]]; then
  player_skill_evalint_bar="\033[1;31m***** \033[m"
 elif [[ $player_skill_evalint -ge 100 ]]; then
  player_skill_evalint_bar="\033[1;31m******\033[m"
 fi
 if [[ $player_skill_healing -lt 20 ]]; then
  player_skill_healing_bar="\033[1;31m*     \033[m"
 elif [[ $player_skill_healing -ge 20 && $player_skill_healing -lt 40 ]]; then
  player_skill_healing_bar="\033[1;31m**    \033[m"
 elif [[ $player_skill_healing -ge 40 && $player_skill_healing -lt 60 ]]; then
  player_skill_healing_bar="\033[1;31m***   \033[m"
 elif [[ $player_skill_healing -ge 60 && $player_skill_healing -lt 80 ]]; then
  player_skill_healing_bar="\033[1;31m****  \033[m"
 elif [[ $player_skill_healing -ge 80 && $player_skill_healing -lt 100 ]]; then
  player_skill_healing_bar="\033[1;31m***** \033[m"
 elif [[ $player_skill_healing -ge 100 ]]; then
  player_skill_healing_bar="\033[1;31m******\033[m"
 fi
 if [[ $player_skill_meditation -lt 20 ]]; then
  player_skill_meditation_bar="\033[1;31m*     \033[m"
 elif [[ $player_skill_meditation -ge 20 && $player_skill_meditation -lt 40 ]]; then
  player_skill_meditation_bar="\033[1;31m**    \033[m"
 elif [[ $player_skill_meditation -ge 40 && $player_skill_meditation -lt 60 ]]; then
  player_skill_meditation_bar="\033[1;31m***   \033[m"
 elif [[ $player_skill_meditation -ge 60 && $player_skill_meditation -lt 80 ]]; then
  player_skill_meditation_bar="\033[1;31m****  \033[m"
 elif [[ $player_skill_meditation -ge 80 && $player_skill_meditation -lt 100 ]]; then
  player_skill_meditation_bar="\033[1;31m***** \033[m"
 elif [[ $player_skill_meditation -ge 100 ]]; then
  player_skill_meditation_bar="\033[1;31m******\033[m"
 fi
 if [[ $player_skill_focus -lt 20 ]]; then
  player_skill_focus_bar="\033[1;31m*     \033[m"
 elif [[ $player_skill_focus -ge 20 && $player_skill_focus -lt 40 ]]; then
  player_skill_focus_bar="\033[1;31m**    \033[m"
 elif [[ $player_skill_focus -ge 40 && $player_skill_focus -lt 60 ]]; then
  player_skill_focus_bar="\033[1;31m***   \033[m"
 elif [[ $player_skill_focus -ge 60 && $player_skill_focus -lt 80 ]]; then
  player_skill_focus_bar="\033[1;31m****  \033[m"
 elif [[ $player_skill_focus -ge 80 && $player_skill_focus -lt 100 ]]; then
  player_skill_focus_bar="\033[1;31m***** \033[m"
 elif [[ $player_skill_focus -ge 100 ]]; then
  player_skill_focus_bar="\033[1;31m******\033[m"
 fi
 if [[ $player_skill_anatomy -lt 20 ]]; then
  player_skill_anatomy_bar="\033[1;31m*     \033[m"
 elif [[ $player_skill_anatomy -ge 20 && $player_skill_anatomy -lt 40 ]]; then
  player_skill_anatomy_bar="\033[1;31m**    \033[m"
 elif [[ $player_skill_anatomy -ge 40 && $player_skill_anatomy -lt 60 ]]; then
  player_skill_anatomy_bar="\033[1;31m***   \033[m"
 elif [[ $player_skill_anatomy -ge 60 && $player_skill_anatomy -lt 80 ]]; then
  player_skill_anatomy_bar="\033[1;31m****  \033[m"
 elif [[ $player_skill_anatomy -ge 80 && $player_skill_anatomy -lt 100 ]]; then
  player_skill_anatomy_bar="\033[1;31m***** \033[m"
 elif [[ $player_skill_anatomy -ge 100 ]]; then
  player_skill_anatomy_bar="\033[1;31m******\033[m"
 fi

 clear
 echo -e "

 Skills:
  Major Combat:

   [$player_skill_fencing_bar]  Fencing: $player_skill_fencing
   [$player_skill_swordsman_bar]  Swordsmanship: $player_skill_swordsman
   [$player_skill_macefighting_bar]  Mace Fighting: $player_skill_macefighting
   [$player_skill_archery_bar]  Archery: $player_skill_archery
   [$player_skill_magery_bar]  Magery: $player_skill_magery
 
  Supporting Combat:
   [$player_skill_tactics_bar]  Tactics: $player_skill_tactics
   [$player_skill_evalint_bar]  Evaluating Intelligence: $player_skill_evalint
   [$player_skill_healing_bar]  Healing: $player_skill_healing

  Miscellaneous:
   [$player_skill_focus_bar]  Focus $player_skill_focus
   [$player_skill_meditation_bar]  Meditation $player_skill_meditation
   [$player_skill_anatomy_bar]  Anatomy $player_skill_anatomy
"
pause
player.paperdoll
}
