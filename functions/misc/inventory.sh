#!/bin/bash

function inventory {
if [[ $player_item_own_dagger -ge 1 ]]; then
 doown_dagger="\033[1;31mX\033[m"
else
 doown_dagger="-"
fi
if [[ $player_item_own_kryss -ge 1 ]]; then
 doown_kryss="\033[1;31mX\033[m"
else
 doown_kryss="-"
fi
if [[ $player_item_own_rapier -ge 1 ]]; then
 doown_rapier="\033[1;31mX\033[m"
else
 doown_rapier="-"
fi
if [[ $player_item_own_warfork -ge 1 ]]; then
 doown_warfork="\033[1;31mX\033[m"
else
 doown_warfork="-"
fi
if [[ $player_item_own_longsword -ge 1 ]]; then
 doown_longsword="\033[1;31mX\033[m"
else
 doown_longsword="-"
fi
if [[ $player_item_own_broadsword -ge 1 ]]; then
 doown_broadsword="\033[1;31mX\033[m"
else
 doown_broadsword="-"
fi
if [[ $player_item_own_claymore -ge 1 ]]; then
 doown_claymore="\033[1;31mX\033[m"
else
 doown_claymore="-"
fi
if [[ $player_item_own_spear -ge 1 ]]; then
 doown_spear="\033[1;31mX\033[m"
else
 doown_spear="-"
fi
if [[ $player_item_own_glave -ge 1 ]]; then
 doown_glave="\033[1;31mX\033[m"
else
 doown_glave="-"
fi
if [[ $player_item_own_club -ge 1 ]]; then
 doown_club="\033[1;31mX\033[m"
else
 doown_club="-"
fi
if [[ $player_item_own_mace -ge 1 ]]; then
 doown_mace="\033[1;31mX\033[m"
else
 doown_mace="-"
fi
if [[ $player_item_own_morningstar -ge 1 ]]; then
 doown_morningstar="\033[1;31mX\033[m"
else
 doown_morningstar="-"
fi
if [[ $player_item_own_maul -ge 1 ]]; then
 doown_maul="\033[1;31mX\033[m"
else
 doown_maul="-"
fi
if [[ $player_item_own_flail -ge 1 ]]; then
 doown_flail="\033[1;31mX\033[m"
else
 doown_flail="-"
fi
if [[ $player_item_own_bow -ge 1 ]]; then
 doown_bow="\033[1;31mX\033[m"
else
 doown_bow="-"
fi
if [[ $player_item_own_longbow -ge 1 ]]; then
 doown_longbow="\033[1;31mX\033[m"
else
 doown_longbow="-"
fi
if [[ $player_item_own_compositebow -ge 1 ]]; then
 doown_compositebow="\033[1;31mX\033[m"
else
 doown_compositebow="-"
fi
if [[ $player_item_own_repeatingcrossbow -ge 1 ]]; then
 doown_repeatingcrossbow="\033[1;31mX\033[m"
else
 doown_repeatingcrossbow="-"
fi
if [[ $player_item_own_spellbook -ge 1 ]]; then
 doown_spellbook="\033[1;31mX\033[m"
else
 doown_spellbook="-"
fi
if [[ $player_item_own_wand -ge 1 ]]; then
 doown_wand="\033[1;31mX\033[m"
else
 doown_wand="-"
fi
if [[ $player_item_own_staff -ge 1 ]]; then
 doown_staff="\033[1;31mX\033[m"
else
 doown_staff="-"
fi
if [[ $player_item_own_spelltome -ge 1 ]]; then
 doown_spelltome="\033[1;31mX\033[m"
else
 doown_spelltome="-"
fi
if [[ $player_item_own_head_leather -ge 1 ]]; then
 doown_head_leather="\033[1;31mX\033[m"
else
 doown_head_leather="-"
fi
if [[ $player_item_own_neck_leather -ge 1 ]]; then
 doown_neck_leather="\033[1;31mX\033[m"
else
 doown_neck_leather="-"
fi
if [[ $player_item_own_arms_leather -ge 1 ]]; then
 doown_arms_leather="\033[1;31mX\033[m"
else
 doown_arms_leather="-"
fi
if [[ $player_item_own_torso_leather -ge 1 ]]; then
 doown_torso_leather="\033[1;31mX\033[m"
else
 doown_torso_leather="-"
fi
if [[ $player_item_own_gloves_leather -ge 1 ]]; then
 doown_gloves_leather="\033[1;31mX\033[m"
else
 doown_gloves_leather="-"
fi
if [[ $player_item_own_leggings_leather -ge 1 ]]; then
 doown_leggings_leather="\033[1;31mX\033[m"
else
 doown_leggings_leather="-"
fi
if [[ $player_item_own_head_dullcopper -ge 1 ]]; then
 doown_head_dullcopper="\033[1;31mX\033[m"
else
 doown_head_dullcopper="-"
fi
if [[ $player_item_own_neck_dullcopper -ge 1 ]]; then
 doown_neck_dullcopper="\033[1;31mX\033[m"
else
 doown_neck_dullcopper="-"
fi
if [[ $player_item_own_arms_dullcopper -ge 1 ]]; then
 doown_arms_dullcopper="\033[1;31mX\033[m"
else
 doown_arms_dullcopper="-"
fi
if [[ $player_item_own_torso_dullcopper -ge 1 ]]; then
 doown_torso_dullcopper="\033[1;31mX\033[m"
else
 doown_torso_dullcopper="-"
fi
if [[ $player_item_own_gloves_dullcopper -ge 1 ]]; then
 doown_gloves_dullcopper="\033[1;31mX\033[m"
else
 doown_gloves_dullcopper="-"
fi
if [[ $player_item_own_leggings_dullcopper -ge 1 ]]; then
 doown_leggings_dullcopper="\033[1;31mX\033[m"
else
 doown_leggings_dullcopper="-"
fi
if [[ $player_item_own_head_shadowiron -ge 1 ]]; then
 doown_head_shadowiron="\033[1;31mX\033[m"
else
 doown_head_shadowiron="-"
fi
if [[ $player_item_own_neck_shadowiron -ge 1 ]]; then
 doown_neck_shadowiron="\033[1;31mX\033[m"
else
 doown_neck_shadowiron="-"
fi
if [[ $player_item_own_arms_shadowiron -ge 1 ]]; then
 doown_arms_shadowiron="\033[1;31mX\033[m"
else
 doown_arms_shadowiron="-"
fi
if [[ $player_item_own_torso_shadowiron -ge 1 ]]; then
 doown_torso_shadowiron="\033[1;31mX\033[m"
else
 doown_torso_shadowiron="-"
fi
if [[ $player_item_own_gloves_shadowiron -ge 1 ]]; then
 doown_gloves_shadowiron="\033[1;31mX\033[m"
else
 doown_gloves_shadowiron="-"
fi
if [[ $player_item_own_leggings_shadowiron -ge 1 ]]; then
 doown_leggings_shadowiron="\033[1;31mX\033[m"
else
 doown_leggings_shadowiron="-"
fi
if [[ $player_item_own_head_copper -ge 1 ]]; then
 doown_head_copper="\033[1;31mX\033[m"
else
 doown_head_copper="-"
fi
if [[ $player_item_own_neck_copper -ge 1 ]]; then
 doown_neck_copper="\033[1;31mX\033[m"
else
 doown_neck_copper="-"
fi
if [[ $player_item_own_arms_copper -ge 1 ]]; then
 doown_arms_copper="\033[1;31mX\033[m"
else
 doown_arms_copper="-"
fi
if [[ $player_item_own_torso_copper -ge 1 ]]; then
 doown_torso_copper="\033[1;31mX\033[m"
else
 doown_torso_copper="-"
fi
if [[ $player_item_own_gloves_copper -ge 1 ]]; then
 doown_gloves_copper="\033[1;31mX\033[m"
else
 doown_gloves_copper="-"
fi
if [[ $player_item_own_leggings_copper -ge 1 ]]; then
 doown_leggings_copper="\033[1;31mX\033[m"
else
 doown_leggings_copper="-"
fi
if [[ $player_item_own_head_bronze -ge 1 ]]; then
 doown_head_bronze="\033[1;31mX\033[m"
else
 doown_head_bronze="-"
fi
if [[ $player_item_own_neck_bronze -ge 1 ]]; then
 doown_neck_bronze="\033[1;31mX\033[m"
else
 doown_neck_bronze="-"
fi
if [[ $player_item_own_arms_bronze -ge 1 ]]; then
 doown_arms_bronze="\033[1;31mX\033[m"
else
 doown_arms_bronze="-"
fi
if [[ $player_item_own_torso_bronze -ge 1 ]]; then
 doown_torso_bronze="\033[1;31mX\033[m"
else
 doown_torso_bronze="-"
fi
if [[ $player_item_own_gloves_bronze -ge 1 ]]; then
 doown_gloves_bronze="\033[1;31mX\033[m"
else
 doown_gloves_bronze="-"
fi
if [[ $player_item_own_leggings_bronze -ge 1 ]]; then
 doown_leggings_bronze="\033[1;31mX\033[m"
else
 doown_leggings_bronze="-"
fi
if [[ $player_item_own_head_gold -ge 1 ]]; then
 doown_head_gold="\033[1;31mX\033[m"
else
 doown_head_gold="-"
fi
if [[ $player_item_own_neck_gold -ge 1 ]]; then
 doown_neck_gold="\033[1;31mX\033[m"
else
 doown_neck_gold="-"
fi
if [[ $player_item_own_arms_gold -ge 1 ]]; then
 doown_arms_gold="\033[1;31mX\033[m"
else
 doown_arms_gold="-"
fi
if [[ $player_item_own_torso_gold -ge 1 ]]; then
 doown_torso_gold="\033[1;31mX\033[m"
else
 doown_torso_gold="-"
fi
if [[ $player_item_own_gloves_gold -ge 1 ]]; then
 doown_gloves_gold="\033[1;31mX\033[m"
else
 doown_gloves_gold="-"
fi
if [[ $player_item_own_leggings_gold -ge 1 ]]; then
 doown_leggings_gold="\033[1;31mX\033[m"
else
 doown_leggings_gold="-"
fi
if [[ $player_item_own_head_agapite -ge 1 ]]; then
 doown_head_agapite="\033[1;31mX\033[m"
else
 doown_head_agapite="-"
fi
if [[ $player_item_own_neck_agapite -ge 1 ]]; then
 doown_neck_agapite="\033[1;31mX\033[m"
else
 doown_neck_agapite="-"
fi
if [[ $player_item_own_arms_agapite -ge 1 ]]; then
 doown_arms_agapite="\033[1;31mX\033[m"
else
 doown_arms_agapite="-"
fi
if [[ $player_item_own_torso_agapite -ge 1 ]]; then
 doown_torso_agapite="\033[1;31mX\033[m"
else
 doown_torso_agapite="-"
fi
if [[ $player_item_own_gloves_agapite -ge 1 ]]; then
 doown_gloves_agapite="\033[1;31mX\033[m"
else
 doown_gloves_agapite="-"
fi
if [[ $player_item_own_leggings_agapite -ge 1 ]]; then
 doown_leggings_agapite="\033[1;31mX\033[m"
else
 doown_leggings_agapite="-"
fi
if [[ $player_item_own_head_verite -ge 1 ]]; then
 doown_head_verite="\033[1;31mX\033[m"
else
 doown_head_verite="-"
fi
if [[ $player_item_own_neck_verite -ge 1 ]]; then
 doown_neck_verite="\033[1;31mX\033[m"
else
 doown_neck_verite="-"
fi
if [[ $player_item_own_arms_verite -ge 1 ]]; then
 doown_arms_verite="\033[1;31mX\033[m"
else
 doown_arms_verite="-"
fi
if [[ $player_item_own_torso_verite -ge 1 ]]; then
 doown_torso_verite="\033[1;31mX\033[m"
else
 doown_torso_verite="-"
fi
if [[ $player_item_own_gloves_verite -ge 1 ]]; then
 doown_gloves_verite="\033[1;31mX\033[m"
else
 doown_gloves_verite="-"
fi
if [[ $player_item_own_leggings_verite -ge 1 ]]; then
 doown_leggings_verite="\033[1;31mX\033[m"
else
 doown_leggings_verite="-"
fi
if [[ $player_item_own_head_valorite -ge 1 ]]; then
 doown_head_valorite="\033[1;31mX\033[m"
else
 doown_head_valorite="-"
fi
if [[ $player_item_own_neck_valorite -ge 1 ]]; then
 doown_neck_valorite="\033[1;31mX\033[m"
else
 doown_neck_valorite="-"
fi
if [[ $player_item_own_arms_valorite -ge 1 ]]; then
 doown_arms_valorite="\033[1;31mX\033[m"
else
 doown_arms_valorite="-"
fi
if [[ $player_item_own_torso_valorite -ge 1 ]]; then
 doown_torso_valorite="\033[1;31mX\033[m"
else
 doown_torso_valorite="-"
fi
if [[ $player_item_own_gloves_valorite -ge 1 ]]; then
 doown_gloves_valorite="\033[1;31mX\033[m"
else
 doown_gloves_valorite="-"
fi
if [[ $player_item_own_leggings_valorite -ge 1 ]]; then
 doown_leggings_valorite="\033[1;31mX\033[m"
else
 doown_leggings_valorite="-"
fi

clear
echo -e "

 What type of items would you like to change out?

"
 select menusel in "Change Weapon" "Change Armor" "Return to Paperdoll"; do
  case $menusel in
   "Change Weapon")
    item.change.weapon.prompt ;;
   "Change Armor")
    item.change.armor.prompt ;;
   "Return to Paperdoll")
    player.paperdoll
    clear ;;
   *)
    inventory ;;
  esac
  break
 done
}

function item.change.weapon.prompt {
clear
echo -e "

Weapons
 Fencing\t\t Archery
  [ $doown_dagger ] Dagger\t\t  [ $doown_bow ] Bow
  [ $doown_kryss ] Kryss\t\t  [ $doown_longbow ] Long Bow
  [ $doown_rapier ] Rapier\t\t  [ $doown_compositebow ] Composite Bow
  [ $doown_warfork ] Warfork\t\t  [ $doown_repeatingcrossbow ] Repeating Crossbow
 Swordsmanship\t\t Magery
  [ $doown_longsword ] Long Sword\t  [ $doown_spellbook ] Spell Book
  [ $doown_broadsword ] Broad Sword\t  [ $doown_wand ] Wand
  [ $doown_claymore ] Claymore\t  [ $doown_staff ] Staff
  [ $doown_spear ] Spear\t\t  [ $doown_spelltome ] Spell Tome
  [ $doown_glave ] Glave\t
 Mace Fighting\t\t\t
  [ $doown_club ] Club\t\t
  [ $doown_mace ] Mace\t\tWeapon: \033[1;35m$player_item_weapon_name\033[m \tArmor: \033[1;35m$player_item_armor_name\033[m
  [ $doown_morningstar ] Morningstar\t\t
  [ $doown_maul ] Maul\t\t
  [ $doown_flail ] Flail\t\t
"
 echo -en "\n   Type the weapon you would like to equip: "
 read weapon_change
 if [[ -f items/weapons/${weapon_change}.sh ]]; then
  source items/weapons/${weapon_change}.sh
  ${weapon_change}.weapon
  player_item_weapon=${weapon_change}
  player_item_weapon_name=$item_weapon_name
  echo -e "\n\tItem: \033[1;35m$player_item_weapon_name\033[m equiped."
 else
  echo -e "\n\tItem: ${weapon_change} appears to not exist."
 fi 
 pause
 saveprofile_quiet
 player.source
}

function item.change.armor.prompt {

clear
echo -e "

Armor
 Leather\t\t\tBronze
  [ $doown_gloves_leather ] Leather Gloves\t\t [ $doown_gloves_bronze ] Bronze Gloves\t\t
  [ $doown_neck_leather ] Leather Gorget\t\t [ $doown_gloves_bronze ] Bronze Gloves\t\t
  [ $doown_arms_leather ] Leather Sleeves\t\t [ $doown_arms_bronze ] Bronze Sleeves\t\t
  [ $doown_head_leather ] Leather Cap\t\t [ $doown_head_bronze ] Bronze Helmet\t\t
  [ $doown_torso_leather ] Leather Chest Piece\t [ $doown_torso_bronze ] Bronze Chest Piece\t\t
  [ $doown_leggings_leather ] Leather Leggings\t [ $doown_leggings_bronze ] Bronze Leggings\t\t
 Dull Copper\t\t\tGold
  [ $doown_gloves_dullcopper ] Dull Copper Gloves\t [ $doown_gloves_gold ] Gold Gloves\t\t
  [ $doown_neck_dullcopper ] Dull Copper Gorget\t [ $doown_neck_gold ] Gold Gorget\t\t
  [ $doown_arms_dullcopper ] Dull Copper Sleeves\t [ $doown_arms_gold ] Gold Sleeves\t\t
  [ $doown_head_dullcopper ] Dull Copper Helmet\t [ $doown_head_gold ] Gold Helmet\t\t
  [ $doown_torso_dullcopper ] Dull Copper Chest Piece\t [ $doown_torso_gold ] Gold Chest Piece\t\t
  [ $doown_leggings_dullcopper ] Dull Copper Leggings\t [ $doown_torso_gold ] Gold Chest Piece\t\t
 Shadow Iron\t\t\tAgapite
  [ $doown_gloves_shadowiron ] Shadow Iron Gloves\t [ $doown_gloves_agapite ] Agapite Gloves\t\t
  [ $doown_neck_shadowiron ] Shadow Iron Gorget\t [ $doown_neck_agapite ] Agapite Gorget\t\t
  [ $doown_arms_shadowiron ] Shadow Iron Sleeves\t [ $doown_arms_agapite ] Agapite Sleeves\t\t
  [ $doown_head_shadowiron ] Shadow Iron Helmet\t [ $doown_head_agapite ] Agapite Helmet\t\t
  [ $doown_torso_shadowiron ] Shadow Iron Chest Piece\t [ $doown_torso_agapite ] Agapite Chest Piece\t\t
  [ $doown_leggings_shadowiron ] Shadow Iron Leggings\t [ $doown_leggings_agapite ] Agapite Leggings\t\t
 Copper\t\t\t\tVerite
  [ $doown_gloves_copper ] Copper Gloves\t\t [ $doown_gloves_verite ] Verite Gloves\t\t
  [ $doown_neck_copper ] Copper Gorget\t\t [ $doown_neck_verite ] Verite Gorget\t\t
  [ $doown_arms_copper ] Copper Sleeves\t\t [ $doown_arms_verite ] Verite Sleeves\t\t
  [ $doown_head_copper ] Copper Helmet\t\t [ $doown_head_verite ] Verite Helmet\t\t
  [ $doown_torso_copper ] Copper Chest Piece\t [ $doown_torso_verite ] Verite Chest Piece\t\t
  [ $doown_leggings_copper ] Copper Leggings\t\t [ $doown_leggings_verite ] Verite Leggings\t\t
\t\t\t\tValorite
\t\t\t\t [ $doown_gloves_valorite ] Valorite Gloves\t\t
\tDefense: $item_armor_defense\t\t [ $doown_neck_valorite ] Valorite Gorget\t\t
\tRange:   $item_armor_defense_range\t\t [ $doown_arms_valorite ] Valorite Sleeves\t\t
\t\t\t\t [ $doown_head_valorite ] Valorite Helmet\t\t
\t\t\t\t [ $doown_torso_valorite ] Valorite Chest Piece\t\t
\t\t\t\t [ $doown_leggings_valorite ] Valorite Leggings\t\t

"
 echo -en "\n   Type the armor you would like to equip: "
 read armor_change
 armor_item=`echo $armor_change | cut -d'_' -f1`
 armor_type=`echo $armor_change | cut -d'_' -f2`
 if [[ -f items/armor/${armor_type}/${armor_change}.sh ]]; then
  source items/armor/${armor_type}/${armor_change}.sh
  ${armor_item}.${armor_type}.armor
  if [[ $armor_item == "gloves" ]]; then
   player_item_gloves=$item_armor_gloves
   player_item_gloves_name=$item_armor_gloves_name
   player_item_equip_name=$player_item_gloves_name
  elif [[ $armor_item == "neck" ]]; then
   player_item_neck=$item_armor_neck
   player_item_neck_name=$item_armor_neck_name
   player_item_equip_name=$player_item_neck_name
  elif [[ $armor_item == "arms" ]]; then
   player_item_arms=$item_armor_arms
   player_item_arms_name=$item_armor_arms_name
   player_item_equip_name=$player_item_arms_name
  elif [[ $armor_item == "head" ]]; then
   player_item_head=$item_armor_head
   player_item_head_name=$item_armor_head_name
   player_item_equip_name=$player_item_head_name
  elif [[ $armor_item == "torso" ]]; then
   player_item_torso=$item_armor_torso
   player_item_torso_name=$item_armor_torso_name
   player_item_equip_name=$player_item_torso_name
  elif [[ $armor_item == "leggings" ]]; then
   player_item_leggings=$item_armor_leggings
   player_item_leggings_name=$item_armor_leggings_name
   player_item_equip_name=$player_item_leggings_name
  fi
  echo -e "\n\tItem: \033[1;35m$player_item_equip_name\033[m equiped."
 else
  echo -e "\n\tItem: ${armor_change} appears to not exist."
 fi
 pause
 $item_armor_set
 saveprofile_quiet
 player.source
 inventory 
}
