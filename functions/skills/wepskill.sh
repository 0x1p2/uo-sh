#!/bin/bash

function pskillgain {
 if [[ $item_weapon_class == "archery" ]]; then
  source skills/archery.sh
  skillgain.archery
 elif [[ $item_weapon_class == "fencing" ]]; then
  source skills/fencing.sh
  skillgain.fencing
 elif [[ $item_weapon_class == "swordsman" ]]; then
  source skills/swordsman.sh
  skillgain.swordsman
 elif [[ $item_weapon_class == "macefighting" ]]; then
  source skills/macefighting.sh
  skillgain.macefighting
 elif [[ $item_weapon_class == "magery" ]]; then
  source skills/magery.sh
  skillgain.magery
 else
  player_item_weapon_class="ubws"	#use best weapon skill
  source skills/${player_skill_primary_name}.sh
  skillgain.${player_skill_primary_name}
 fi
}
