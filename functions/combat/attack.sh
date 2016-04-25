#!/bin/bash


###################
# attack function #
function attack {
 statgain
 pskillgain
 supskillgain
 skillgain.anatomy

 player.statmod
 npc.statmod

 player_damage=$[ $player_attack_total + 0 ]

 player.special.dot.status
 player.special.attack.status
 player.special.delay.status
 player.special.armorignore.status

 if [[ $player_item_weapon_durability_cap = 0 ]]; then
  player_damage=$[ $player_damage / 2 ]
  player_item_weapon="fist"
  echo -e " [\\033[1;33m-\\033[m]  \\033[1;33mYour weapon has broken. Fix it at the provisioners.\\033[m"
 fi

 if [[ $item_weapon_class == "archery" ]]; then
  player_item_arrow=$[ $player_item_arrow - 1 ]
  if [[ $player_item_arrow -le 0 ]]; then
   player_item_arrow=0
   echo -e " [\\033[1;33m-\\033[m]  \033[1;31mYou are out of arrows. Performing half damage.\033[m"
   player_attack_total=$[ $player_attack_total / 2 ]
  else
   player_attack_total=$[ $player_attack_total + 1 ]
  fi
 elif [[ $item_weapon_class == "magery" ]]; then
  player_item_reagent=$[ $player_item_reagent - 1 ]
  if [[ $player_item_reagent -le 0 ]]; then
   player_item_reagent=0
   echo -e " [\\033[1;33m-\\033[m]  You are out of reagents. Performing half damage."
   player_attack_total=$[ $player_attack_total / 2 ]
  fi
 fi

 if [[ $armorignore < 1 ]]; then
  if [[ $player_attack_total -gt $npc_defense_total ]]; then
   player_damage=$[ $player_attack_total - $npc_defense_total ]
   npc_hp=$[ $npc_hp - $player_damage ]
   npc_defense_block=$[ $npc_defense_total - $player_attack_total ]
  else
   player_damage=$[ $npc_defense_total - $player_attack_total / 2 ]
   npc_hp=$[ $npc_hp - $player_damage ]
  fi
 else
  npc_hp=$[ $npc_hp - $player_damage ]
  npc_defense_total=0
  armorignore=$[ $armorignore - 1 ]
  if [[ $armorignore -le 0 ]]; then
   armorignore=0
  fi
 fi


 if [[ $npc_hp -le 0 ]]; then

  npc_hp=0
  echo -e " [\033[1;36m+\033[m]  \\033[1;37m$player_name\\033[m has dealt \\033[1;31m$player_damage\\033[m damage [\\033[1;34m$npc_defense_total\033[m of \\033[1;34m$player_attack_total\\033[m was Blocked] to $npc_name."
  echo -e " [\033[1;36m+\033[m]  $npc_name appears to be dead."

  pause
  npc_alive_status

 else

  echo -e " [\033[1;36m+\033[m]  \\033[1;37m$player_name\\033[m has dealt \\033[1;31m$player_damage\\033[m damage [\\033[1;34m$npc_defense_total\033[m of \\033[1;34m$player_attack_total\\033[m was Blocked] to $npc_name."
  echo -e " [\033[1;36m+\033[m]  $npc_name has only \\033[1;32m$npc_hp\\033[m healthpoints left."

  if [[ $player_distance > 0 ]]; then
   echo -e " [\033[1;36m+\033[m]  \033[1;37m$player_name\033[m is a distance of $player_distance from $npc_name\n\t $npc_name is still approaching \033[1;37m$player_name\033[m."
   player_distance=$[ $player_distance - 1 ]
   player.postround

  elif [[ $player_attack_place = 1 ]]; then
   defend

  else
   player.postround
  fi
 fi
}

