#!/bin/bash

item_armor_gloves_set=gloves.dullcopper.armor
item_armor_gloves_type=dullcopper
echo "outside"
function gloves.dullcopper.armor {
echo "inside"
 item_level=2
 item_armor_gloves=gloves_dullcopper
 item_armor_gloves_name="Dull Copper Gloves"
 
 item_armor_gloves_durability=$player_item_armor_gloves_durability
 item_armor_gloves_durability_cap=71
 
 item_armor_gloves_defense=2
 item_armor_gloves_defense_range=1
 
 item_armor_physical=3
 item_armor_energy=2
 item_armor_fire=2
 item_armor_cold=2
 item_armor_poison=2


}
