#!/bin/bash

function player.equipment.status {
  if [[ $player_class == "Mage" || $player_class == "Archer" ]]; then
   player_item_armor_durability=$[ $player_item_armor_durability - 1 ]
  else
   player_item_armor_durability=$[ $player_item_armor_durability - 2 ]
  fi

  if [[ $player_item_weapon_durability -le 0 ]]; then
   player_item_weapon_durability=0
   player_item_weapon_durability_cap=$[ $player_item_weapon_durability_cap - 1 ]
   wepdurstatus=`echo "weapon maximum durability decreased by 1"`
   if $player_item_weapon_durability_cap=$[ $player_item_weapon_durability_cap -le 0 ]]; then
    player_item_weapon_durability_cap=0
   fi
  else
   wepdurstatus=`echo "weapon durability has decreased by 1"`
  fi

  if [[ $player_item_armor_durability -le 0 ]]; then
   player_item_armor_durability=0
   player_item_armor_durability_cap=$[ $player_item_armor_durability_cap - 1 ]
   if [[ $player_item_armor_durability_cap -le 0 ]]; then
    player_item_armor_durability_cap=0
   fi
   armordurstatus=`echo "armor maximum durability decreased by 1"`
  else
   armordurstatus=`echo "armor durability has decreased by 1"`
  fi
}

function player.equipment.defend.status {
 if [[ $player_item_armor_durability_cap = 0 ]]; then
  player_defense_total=$[ $player_defense_total / 2 ]
  echo -e "  [\033[1;33m-\033[m]  \033[1;33mYour armor has broken. Fix it at the provisioners.\033[m"
 fi


 if [[ $npc_namespare == "Earth Elemental" ]]; then
  player_item_armor_durability=$[ $player_item_armor_durability - 1]
 fi
}
