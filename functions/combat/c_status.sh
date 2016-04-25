#!/bin/bash


function npc_alive_status {

 player.statmod
 npc.statmod

 roundnum=$[ $roundnum + 1 ]
 player_hp_bar=$[ $player_hp_modifier_increase + 0 ]
 player_stamina=$[ $player_stamina + $player_stamina_regeneration_temp ]
 if [[ $player_stamina -ge $player_stamina_cap_temp ]]; then
  player_stamina=$player_stamina_cap_temp
 fi

 npc_stamina=$[ $npc_stamina + $npc_stamina_regeneration ]
 if [[ $npc_stamina -ge $npc_stamina_cap ]]; then
  npc_stamina=$npc_stamina_cap
 fi

 clear
 echo " "
 echo -e "  Your \tHP: \\033[1;32m$player_hp\033[m / \033[1;32m$player_hp_bar\033[m\tWep: \033[36m$player_item_weapon_name\033[m\tGold: \033[33m$player_item_gold\033[m 
 \\033[1;30m---------------------------------------------------------------\\033[m
  NPC \tHP: \033[1;32m$npc_hp\033[m\t\tDifficulty: $npc_difficulty\t 
  Weapon: \033[36m$npc_item_weapon\033[m\tRound: [\033[1;36m$roundnum\033[m] "
 echo ""
 sleep 1


 if [[ $npc_hp = 0 ]]; then

  npcoriginalname=$npc_name
  npc_item_gold=$(($RANDOM%$npc_item_gold_range + $npc_item_gold))
  player_fame=$[ $player_fame + $npc_fame ]
  player_item_gold=$[ $player_item_gold + $npc_item_gold ]
  player_item_weapon_durability=$[ $player_item_weapon_durability - 1 ]
  player_killcount=$[ $player_killcount + 1 ]
  player_special_dot_flag=0
  player_special_aura_flag=0
  completed=1
  
  player_equipment_status

  echo -e " "
  echo -e " [\033[1;36m+\033[m]  $npc_name is dead! "
  echo -e " [\033[1;33m-\033[m]  Your $wepdurstatus and $armordurstatus."
  echo -e " [\033[1;36m+\033[m]  \033[1;37m$player_name\033[m has dealt \033[1;31m$player_damage\033[m for the finishing blow on $npc_name."
  echo -e "  \033[1;36m+---\033[m You leave the battle with \033[1;32m$player_hp\033[m healthpoints."
  echo -e " [\033[1;36m+\033[m]  \033[1;37m$player_name\033[m gained \033[33m$npc_item_gold\033[m gold from $npc_name's corpse."

 else
  
  if [[ $player_distance > 0 ]]; then
   attack
  else
   if [[ $player_speed -ge $npc_speed ]]; then
    player_attack_place=1
    attack
   else
    player_attack_place=2
    defend
   fi
  fi
 fi
}


function player.alive.status {

 roundnum=$[ $roundnum + 1 ]
 player_stamina=$[ $player_stamina + $player_stamina_regeneration_temp ]

 clear
 echo " "
 echo -e "  Your \tHP: \033[1;32m$player_hp\033[m / \033[1;32m$player_hp_bar\033[m\tWep: \033[36m$player_item_weapon_name\033[m\tGold: \033[33m$player_item_gold\033[m
  \\033[1;30m---------------------------------------------------------------\\033[m
  NPC \tHP: \033[1;32m$npc_hp\033[m\t\tDifficulty: $npc_difficulty\t
  Wep: \033[36m$npc_item_weapon\033[m\tRound: [\033[1;36m$roundnum\033[m] "
 sleep 1
 if [[ $player_hp = 0 ]]; then
  echo " "
  echo -en " [\\033[1;33m-\\033[m]  Your character is dead...
  Do you wish to play again?
   Option [y/n]: "
  read optyn
  if [[ $optyn = n || $optyn = N ]]; then
   clear && echo " " && echo " Thanks for playing." && pause && clear && exit
   rm profiles/$player_name.*
  else
   if [[ -f profile/$player_name.conf ]]; then
    echo -en " [\033[1;36m+\033[m]  You have a saved profile. Do you wish to load it?
 Option [y/n]: "
    read optyn
    if [[ $optyn = y || $optyn = Y || $optyn == "" ]]; then
     source profile/$player_name.conf
     player_hp=$[ $player_hp_cap + 0 ]
     player_item_gold=$[ $player_item_gold / 2 ]
     player_deaths=$[ $player_deaths + 1 ]
     saveprofile
     britannia.towncenter
    else
     player.classmenu
    fi
   else
    echo -e "[\033[31m-\033[m]  No saved profiles. Saving profile..."
    player_hp=$[ $player_hp_cap + 0 ]
    player_item_gold=$[ $player_item_gold / 2 ]
    player_deaths=$[ $player_deaths + 1 ]
    saveprofile
    britannia.towncenter
    fi
   fi 
  fi
}
