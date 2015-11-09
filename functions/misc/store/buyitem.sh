#!/bin/bash

source items/list.sh
source misc/store/transaction.sh

function buyitem {
 echo " "
 echo " "
 echo -en " [\\033[1;36m+\\033[m]  How many would you like to buy: [#]: "
 read itemnum
 if [[ $itemnum == ' ' || $itemnum = 0 || $itemnum == "" ]]; then
  itemnum=0
 else
  item_price_total=$[ $itemnum * $item_price ]
  if [[ $item_price_total -gt $player_item_gold ]]; then
   echo " "
   echo -e " [\\033[1;33m-\\033[m]  You do not have enough gold for that. Price: $item_price_total  Your Gold: $player_item_gold"
   pause
  else
    item_purchase=1
    item.list
    player_item_gold=$[ $player_item_gold - $item_price_total ]
    echo " "
    echo -e " [\\033[1;33m-\\033[m]  You lost \\033[33m$item_price_total\\033[m gold. You now have \033[1;34m$itemnum $item_buy[s]\033[m. "
    echo -e " [\\033[1;36m+\\033[m]  You have \\033[33m$player_item_gold\\033[m gold remaining. "
    transaction
    if [[ $item_buy == "weapon_repair" || $item_buy == "armor_repair" ]]; then
     if [[ $item_buy == "weapon_repair" ]]; then
      repair_amount=$[ $itemnum * 20 ]
      player_item_weapon_durability=$[ $repair_amount + $player_item_weapon_durability ]
      if [[ $player_item_weapon_durability -gt $player_item_weapon_durability_cap ]]; then
       over_repair=$[ $player_item_weapon_durability - $player_item_weapon_durability_cap ]
       player_item_weapon_durability=$player_item_weapon_durability_cap
       echo -e " [\\033[1;33m-\\033[m]  You over repaired by: $over_repair"
      fi
     else
      repair_amount=$[ $itemnum * 20 ]
      player_item_armor_durability=$[ $repair_amount + $player_item_armor_durability ]
      if [[ $player_item_armor_durability -gt $player_item_armor_durability_cap ]]; then
       over_repair=$[ $player_item_armor_durability - $player_item_armor_durability_cap ]
       player_item_armor_durability=$player_item_armor_durability_cap
       echo -e " [\\033[1;33m-\\033[m]  You over repaired by: $over_repair"
      fi
     fi
     echo -e " [\\033[1;36m+\\033[m]  You've repaired $repair_amount total" 
    fi
    if [[ $item_buy_type == "armor" || $item_buy_type == "weapon" ]]; then
     if [[ $item_buy_type == "armor" ]]; then
      set.armor.stats
     else
      set.weapon.stats
     fi
     item_buy_type=none
    fi
   fi
   pause
  fi

}


function set.armor.stats {

 armor_type=`echo $item_buy | cut -d'_' -f2`
 source items/armor/$armor_type/${item_buy}.sh
 armor_item=`echo $item_buy | cut -d'_' -f1`
 ${armor_item}.${armor_type}.armor

 player_item_armor=${item_buy}
 player_item_armor_name=$item_armor_name

 player_item_armor_durability=$item_armor_durability_cap
 player_item_armor_durability_cap=$item_armor_durability_cap

 saveprofile_quiet
 player.source
}

function set.weapon.stats {

 source items/weapons/${item_buy}.sh
 ${item_buy}.weapon

 player_item_weapon=${item_buy}
 player_item_weapon_name=$item_weapon_name

 player_item_weapon_durability=$item_weapon_durability_cap
 player_item_weapon_durability_cap=$item_weapon_durability_cap

 saveprofile_quiet
 player.source
}
