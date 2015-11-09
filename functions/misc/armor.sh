#!/bin/bash

function armor.list {

clear

$item_armor_set
#player_armor_head=head_leather
#player_armor_neck=neck_leather
#player_armor_torso=torso_leather
#player_armor_gloves=gloves_leather
#player_armor_leggings=leggings_leather

#item_armor_head_type=`echo $player_armor_head | cut -d'_' -f2`
#item_armor_neck_type=`echo $player_armor_neck | cut -d'_' -f2`
#item_armor_torso_type=`echo $player_armor_torso | cut -d'_' -f2`
#item_armor_gloves_type=`echo $player_armor_gloves | cut -d'_' -f2`
#item_armor_leggings_type=`echo $player_armor_leggings | cut -d'_' -f2`

#source items/armor/$item_armor_head_type/${player_armor_head}.sh
#source items/armor/$item_armor_neck_type/${player_armor_neck}.sh
#source items/armor/$item_armor_torso_type/${player_armor_torso}.sh
#source items/armor/$item_armor_gloves_type/${player_armor_gloves}.sh
#source items/armor/$item_armor_leggings_type/${player_armor_leggings}.sh

#$item_armor_head_set
#$item_armor_neck_set
#$item_armor_torso_set
#$item_armor_gloves_set
#$item_armor_leggings_set


echo -e "

 Current armor settings:
  Head:     $item_armor_head_name\t\tDefense: $item_armor_head_defense
  Neck:     $item_armor_neck_name\tDefense: $item_armor_neck_defense
  Arms:     $item_armor_arms_name\tDefense: $item_armor_arms_defense
  Torso:    $item_armor_torso_name\tDefense: $item_armor_torso_defense
  Gloves:   $item_armor_gloves_name\tDefense: $item_armor_gloves_defense
  Leggings: $item_armor_leggings_name\tDefense: $item_armor_leggings_defense

 Total Defense: $item_armor_defense
 Total Range:   $item_armor_defense_range

"
pause
}
