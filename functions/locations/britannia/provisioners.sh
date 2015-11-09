#!/bin/bash


function britannia.provisioners {
 clear
 echo " "
 echo -e "Provisioners,
   Buy and Sell. "
 echo " "
 select menusel in "Buy" "Sell" "Return to Britannia"; do
  case $menusel in
   "Buy")
    britannia.provisioners.buy ;;
   "Sell")
    echo " "
    echo " The shopkeeper is currently not accepting junk."
    pause
    britannia.provisioners ;;
   "Return to Britannia")
    britannia.towncenter ;;
   *)
    screwup
    britannia.provisioners ;;
  esac
 break
 done
 pause
}

function britannia.provisioners.buy {
 clear
 echo " "
 echo -e " Buy
   Current Gold: \033[33m$player_item_gold\033[m"
 echo " "
 select menusel in "Bandaids - 35G" "Arrows - 3G" "Reagents - 4G" "Repair Weapon - 200G" "Repair Armor - 200G" "Inventory" "Return to shop menu"; do
  case $menusel in
   "Bandaids - 35G")
    item_buy=bandaid
    item_buy_type=misc
    item_price=35
    buyitem ;;
   "Arrows - 3G")
    item_buy=arrow
    item_buy_type=misc
    item_price=3
    buyitem ;;
   "Reagents - 4G")
    item_buy=reagent
    item_buy_type=misc
    item_price=4
    buyitem ;;
   "Repair Weapon - 200G")
    item_buy=weapon_repair
    item_buy_type=misc
    item_price=200
    buyitem ;;
   "Repair Armor - 200G")
    item_buy=armor_repair
    item_buy_type=misc
    item_price=200
    buyitem ;;
   "Inventory")
    player.paperdoll ;;
   "Return to shop menu")
    britannia.provisioners ;;
   *)
  esac
 break
 done
britannia.provisioners.buy
}
