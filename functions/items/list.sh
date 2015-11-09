#!/bin/bash

function item.list {

 if [[ $item_buy == "bandaid" ]]; then
  if [[ $item_purchase = 1 ]]; then
   player_item_bandaid=$[ $player_item_bandaid + $itemnum ]
   item_purchase=0
  fi

 elif [[ $item_buy == "arrow" ]]; then
  if [[ $item_purchase = 1 ]]; then
   player_item_arrow=$[ $player_item_arrow + $itemnum ]
   item_purchase=0
  fi 

 elif [[ $item_buy == "reagent" ]]; then
  if [[ $item_purchase = 1 ]]; then
   player_item_reagent=$[ $player_item_reagent + $itemnum ]
   item_purchase=0
  fi

 elif [[ $item_buy == "weapon_repair" ]]; then
  if [[ $item_purchase = 1 ]]; then
   player_item_weapon_repair=$[ $player_item_weapon_repair + $itemnum ]
   item_purchase=0
  fi

 elif [[ $item_buy == "armor_repair" ]]; then 
  if [[ $item_purchase = 1 ]]; then
   player_item_armor_repair=$[ $player_item_armor_repair + $itemnum ]
   item_purchase=0
  fi

 elif [[ $item_buy == "head_leather" ]]; then 
  if [[ $item_purchase = 1 ]]; then
   player_item_own_head_leather=$[ $player_item_own_head_leather + $itemnum ]
   item_purchase=0
  fi
 elif [[ $item_buy == "neck_leather" ]]; then
  if [[ $item_purchase = 1 ]]; then
   player_item_own_neck_leather=$[ $player_item_own_neck_leather + $itemnum ]
   item_purchase=0
  fi
 elif [[ $item_buy == "arms_leather" ]]; then
  if [[ $item_purchase = 1 ]]; then
   player_item_own_arms_leather=$[ $player_item_own_arms_leather + $itemnum ]
   item_purchase=0
  fi
 elif [[ $item_buy == "torso_leather" ]]; then
  if [[ $item_purchase = 1 ]]; then
   player_item_own_torso_leather=$[ $player_item_own_torso_leather + $itemnum ]
   item_purchase=0
  fi
 elif [[ $item_buy == "gloves_leather" ]]; then
  if [[ $item_purchase = 1 ]]; then
   player_item_own_gloves_leather=$[ $player_item_own_gloves_leather + $itemnum ]
   item_purchase=0
  fi
 elif [[ $item_buy == "leggings_leather" ]]; then
  if [[ $item_purchase = 1 ]]; then
   player_item_own_leggings_leather=$[ $player_item_own_leggings_leather + $itemnum ]
   item_purchase=0
  fi
 elif [[ $item_buy == "head_dullcopper" ]]; then
  if [[ $item_purchase = 1 ]]; then
   player_item_own_head_dullcopper=$[ $player_item_own_head_dullcopper + $itemnum ]
   item_purchase=0
  fi
 elif [[ $item_buy == "neck_dullcopper" ]]; then
  if [[ $item_purchase = 1 ]]; then
   player_item_own_neck_dullcopper=$[ $player_item_own_neck_dullcopper + $itemnum ]
   item_purchase=0
  fi
 elif [[ $item_buy == "arms_dullcopper" ]]; then
  if [[ $item_purchase = 1 ]]; then
   player_item_own_arms_dullcopper=$[ $player_item_own_arms_dullcopper + $itemnum ]
   item_purchase=0
  fi
 elif [[ $item_buy == "torso_dullcopper" ]]; then
  if [[ $item_purchase = 1 ]]; then
   player_item_own_torso_dullcopper=$[ $player_item_own_torso_dullcopper + $itemnum ]
   item_purchase=0
  fi
 elif [[ $item_buy == "gloves_dullcopper" ]]; then
  if [[ $item_purchase = 1 ]]; then
   player_item_own_gloves_dullcopper=$[ $player_item_own_gloves_dullcopper + $itemnum ]
   item_purchase=0
  fi
 elif [[ $item_buy == "leggings_dullcopper" ]]; then
  if [[ $item_purchase = 1 ]]; then
   player_item_own_leggings_dullcopper=$[ $player_item_own_leggings_dullcopper + $itemnum ]
   item_purchase=0
  fi
 fi
}
