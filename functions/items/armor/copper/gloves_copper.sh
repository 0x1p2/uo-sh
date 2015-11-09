#!/bin/bash

item_armor_gloves_set=gloves.copper.armor
item_armor_gloves_type=copper

function gloves.copper.armor {

 item_level=4
 item_armor_gloves=gloves_copper
 item_armor_gloves_name="Copper Gloves"
 
 item_armor_gloves_durability=$player_item_armor_gloves_durability
 item_armor_gloves_durability_cap=82
 
 item_armor_gloves_defense=5
 item_armor_gloves_defense_range=1
 
 item_armor_physical=3
 item_armor_energy=2
 item_armor_fire=2
 item_armor_cold=2
 item_armor_poison=2


}
