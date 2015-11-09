#!/bin/bash

item_armor_set="set.current.armor.set"

function set.current.armor.set { 

#echo -e "
player_item_armor_head=$player_item_armor_head
player_item_armor_neck=$player_item_armor_neck
player_item_armor_arms=$player_item_armor_arms
player_item_armor_torso=$player_item_armor_torso
player_item_armor_gloves=$player_item_armor_gloves
player_item_armor_leggings=$player_item_armor_leggings

item_armor_head_type=`echo $player_item_armor_head | cut -d'_' -f2`
item_armor_neck_type=`echo $player_item_armor_neck | cut -d'_' -f2`
item_armor_arms_type=`echo $player_item_armor_arms | cut -d'_' -f2`
item_armor_torso_type=`echo $player_item_armor_torso | cut -d'_' -f2`
item_armor_gloves_type=`echo $player_item_armor_gloves | cut -d'_' -f2`
item_armor_leggings_type=`echo $player_item_armor_leggings | cut -d'_' -f2`

source items/armor/$item_armor_head_type/${player_item_armor_head}.sh
source items/armor/$item_armor_neck_type/${player_item_armor_neck}.sh
source items/armor/$item_armor_arms_type/${player_item_armor_arms}.sh
source items/armor/$item_armor_torso_type/${player_item_armor_torso}.sh
source items/armor/$item_armor_gloves_type/${player_item_armor_gloves}.sh
source items/armor/$item_armor_leggings_type/${player_item_armor_leggings}.sh

$item_armor_head_set
$item_armor_neck_set
$item_armor_arms_set
$item_armor_torso_set
$item_armor_gloves_set
$item_armor_leggings_set

item_armor_defense=$[ $item_armor_head_defense + $item_armor_neck_defense + $item_armor_arms_defense + $item_armor_torso_defense + $item_armor_gloves_defense + $item_armor_leggings_defense ]
item_armor_defense_range=$[ $item_armor_head_defense_range + $item_armor_neck_defense_range + $item_armor_arms_defense_range + $item_armor_torso_defense_range + $item_armor_gloves_defense_range + $item_armor_leggings_defense_range ]

#" > profiles/${player_name}/armorset
}
