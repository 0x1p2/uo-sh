#!/bin/bash


function britannia.blacksmith {
 clear
 echo " "
 echo -e "Blacksmith,
   Buy and Sell. "
 echo " "
 select menusel in "Buy" "Sell" "Return to Britannia"; do
  case $menusel in
   "Buy")
    britannia.blacksmith.buy ;;
   "Sell")
    echo " "
    echo " The shopkeeper is currently not accepting junk."
    pause
    britannia.blacksmith ;;
   "Return to Britannia")
    britannia.tradedistrict ;;
   *)
    screwup
    britannia.blacksmith ;;
  esac
 break
 done
 pause
}

function britannia.blacksmith.buy {
 clear
 echo " "
 echo -e " Buy
   Current Gold: \033[33m$player_item_gold\033[m"
 echo " "
 select menusel in "Armor" "Weapons" "Inventory" "Return to shop menu"; do
  case $menusel in
   "Armor")
    britannia.blacksmith.buy.armor ;;
   "Weapons")
    britannia.blacksmith.buy.weapons ;;
   "Inventory")
    player.paperdoll ;;
   "Return to shop menu")
    britannia.blacksmith ;;
   *)
  esac
 break
 done
britannia.blacksmith.buy
}

function britannia.blacksmith.buy.armor {
 clear
 echo " "
 echo -e " Buy
   Current Gold: \033[33m$player_item_gold\033[m"
 echo " "
 select menusel in "Dull Copper Gloves(600)" "Dull Copper Gorget(700)" "Dull Copper Sleeves(600)" "Dull Copper Leggings(1100)" "Dull Copper Helmet(1100)" "Dull Copper Chest Piece(1800)" "Paperdoll" "Return to shop menu"; do
  case $menusel in
   "Dull Copper Gloves(600)")
    item_buy=gloves_dullcopper
    item_buy_type=armor
    item_price=600
    buyitem ;;
   "Dull Copper Gorget(700)")
    item_buy=neck_dullcopper
    item_buy_type=armor
    item_price=700
    buyitem ;;
   "Dull Copper Sleeves(600)")
    item_buy=arms_dullcopper
    item_buy_type=armor
    item_price=600
    buyitem ;;
   "Dull Copper Leggings(1100)")
    item_buy=leggings_dullcopper
    item_buy_type=armor
    item_price=1100
    buyitem ;;
   "Dull Copper Helmet(1100)")
    item_buy=head_dullcopper
    item_buy_type=armor
    item_price=1100
    buyitem ;;
   "Dull Copper Chest Piece(1800)")
    item_buy=torso_dullcopper
    item_buy_type=armor
    item_price=1800
    buyitem ;;
   "Paperdoll")
    player.paperdoll ;;
   "Return to shop menu")
    britannia.blacksmith ;;
   *)
  esac
 break
 done
britannia.blacksmith.buy.armor
}

function britannia.blacksmith.buy.weapons {
 clear
 echo " "
 echo -e " Buy

   Fencing       - Dagger     : Kryss       : Rapier        : Warfork
   Swordsman     - Long Sword : Broad Sword : Claymore      : Spear              : Glave
   Mace Fighting - Club       : Mace        : Morningstar   : Maul               : Flail
   Archery       - Bow        : Long Bow    : Composite Bow : Repeating Crossbow
   Magery        - Spell Book : Wand        : Staff         : Spell Tome

   Current Gold: \033[33m$player_item_gold\033[m"
 echo " "
 select menusel in "Fencing" "Swordsmanship" "Mace Fighting" "Archery" "Magery" "Return to shop menu"; do
  case $menusel in
   "Fencing")
    britannia.blacksmith.buy.weapons.fencing ;;
   "Swordsmanship")
    britannia.blacksmith.buy.weapons.swordsmanship ;;
   "Mace Fighting")
    britannia.blacksmith.buy.weapons.macefighting ;;
   "Archery")
    britannia.blacksmith.buy.weapons.archery ;;
   "Magery")
    britannia.blacksmith.buy.weapons.magery ;;
   "Return to shop menu")
    britannia.blacksmith ;;
   *)
  esac
 break
 done
britannia.blacksmith.buy
}

function britannia.blacksmith.buy.weapons.fencing {
 clear
 echo " "
 echo -e " Buy

   Fencing - Dagger : Kryss : Rapier : Warfork

   Current Gold: \033[33m$player_item_gold\033[m"
 echo " "
 select menusel in "Dagger(100)" "Kryss(750)" "Rapier(1500)" "Warfork(5000)" "Return to Weapon Types"; do
  case $menusel in
   "Dagger(100)")
    item_buy=dagger
    item_buy_type=weapon
    item_price=100
    buyitem ;;
   "Kryss(750)")
    item_buy=kryss
    item_buy_type=weapon
    item_price=750
    buyitem ;;
   "Rapier(1500)")
    item_buy=rapier
    item_buy_type=weapon
    item_price=1500
    buyitem ;;
   "Warfork(5000)")
    item_buy=warfork
    item_buy_type=weapon
    item_price=5000
    buyitem ;;
   "Return to Weapon Types")
    britannia.blacksmith.buy.weapons ;;
   *)
  esac
 break
 done
britannia.blacksmith.buy.weapons
}

function britannia.blacksmith.buy.weapons.swordsmanship {
 clear
 echo " "
 echo -e " Buy

   Swordsman - Long Sword : Broad Sword : Claymore : Spear : Glave

   Current Gold: \033[33m$player_item_gold\033[m"
 echo " "
 select menusel in "Long Sword(100)" "Broad Sword(750)" "Claymore(1500)" "Spear(5000)" "Glave(10000)" "Return to Weapon Types"; do
  case $menusel in
   "Long Sword(100)")
    item_buy=longsword
    item_buy_type=weapon
    item_price=100
    buyitem ;;
   "Broad Sword(750)")
    item_buy=broadsword
    item_buy_type=weapon
    item_price=750
    buyitem ;;
   "Claymore(1500)")
    item_buy=claymore
    item_buy_type=weapon
    item_price=1500
    buyitem ;;
   "Spear(5000)")
    item_buy=spear
    item_buy_type=weapon
    item_price=5000
    buyitem ;;
   "Glave(10000)")
    item_buy=glave
    item_buy_type=weapon
    item_price=10000
    buyitem ;;
   "Return to Weapon Types")
    britannia.blacksmith.buy.weapons ;;
   *)
  esac
 break
 done
britannia.blacksmith.buy.weapons
}

function britannia.blacksmith.buy.weapons.macefighting {
 clear
 echo " "
 echo -e " Buy

   Mace Fighter - Club : Mace : Morningstar : Maul : Flail

   Current Gold: \033[33m$player_item_gold\033[m"
 echo " "
 select menusel in "Club(100)" "Mace(750)" "Morningstar(1500)" "Maul(5000)" "Flail(10000)" "Return to Weapon Types"; do
  case $menusel in
   "Club(100)")
    item_buy=club
    item_buy_type=weapon
    item_price=100
    buyitem ;;
   "Mace(750)")
    item_buy=mace
    item_buy_type=weapon
    item_price=750
    buyitem ;;
   "Morningstar(1500)")
    item_buy=morningstar
    item_buy_type=weapon
    item_price=1500
    buyitem ;;
   "Maul(5000)")
    item_buy=maul
    item_buy_type=weapon
    item_price=5000
    buyitem ;;
   "Flail(10000)")
    item_buy=flail
    item_buy_type=weapon
    item_price=10000
    buyitem ;;
   "Return to Weapon Types")
    britannia.blacksmith.buy.weapons ;;
   *)
  esac
 break
 done
britannia.blacksmith.buy.weapons
}

function britannia.blacksmith.buy.weapons.archery {
 clear
 echo " "
 echo -e " Buy

   Archery - Bow : Long Bow : Composite Bow : Repeating Crossbow

   Current Gold: \033[33m$player_item_gold\033[m"
 echo " "
 select menusel in "Bow(100)" "Long Bow(750)" "Composite Bow(1500)" "Repeating Crossbow(1500)" "Return to Weapon Types"; do
  case $menusel in
   "Bow(100)")
    item_buy=bow
    item_buy_type=weapon
    item_price=100
    buyitem ;;
   "Long Bow(750)")
    item_buy=longbow
    item_buy_type=weapon
    item_price=750
    buyitem ;;
   "Composite Bow(1500)")
    item_buy=compositebow
    item_buy_type=weapon
    item_price=1500
    buyitem ;;
   "Repeating Crossbow(1500)")
    item_buy=repeatingcrossbow
    item_buy_type=weapon
    item_price=1500
    buyitem ;;
   "Return to Weapon Types")
    britannia.blacksmith.buy.weapons ;;
   *)
  esac
 break
 done
britannia.blacksmith.buy.weapons
}

function britannia.blacksmith.buy.weapons.magery {
 clear
 echo " "
 echo -e " Buy

   Magery - Spell Book : Wand : Staff : Spell Tome

   Current Gold: \033[33m$player_item_gold\033[m"
 echo " "
 select menusel in "Spell Book(100)" "Wand(750)" "Staff(1500)" "Spell Tome(5000)" "Return to Weapon Types"; do
  case $menusel in
   "Spell Book(100)")
    item_buy=spellbook
    item_buy_type=weapon
    item_price=100
    buyitem ;;
   "Wand(750)")
    item_buy=wand
    item_buy_type=weapon
    item_price=750
    buyitem ;;
   "Staff(1500)")
    item_buy=staff
    item_buy_type=weapon
    item_price=1500
    buyitem ;;
   "Spell Tome(5000)")
    item_buy=spelltome
    item_buy_type=weapon
    item_price=5000
    buyitem ;;
   "Return to Weapon Types")
    britannia.blacksmith.buy.weapons ;;
   *)
  esac
 break
 done
britannia.blacksmith.buy.weapons
}
