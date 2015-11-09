#!/bin/bash

item_armor_leggings_set=leggings.copper.armor
item_armor_leggings_type=copper

function leggings.copper.armor {

 item_level=4
 item_armor_leggings=leggings_copper
 item_armor_leggings_name="Copper Leggings"
 
 item_armor_leggings_durability=$player_item_armor_leggings_durability
 item_armor_leggings_durability_cap=85
 
 item_armor_leggings_defense=10
 item_armor_leggings_defense_range=2
 
 item_armor_physical=3
 item_armor_energy=2
 item_armor_fire=2
 item_armor_cold=2
 item_armor_poison=2


}
