#!/bin/bash

function player.paperdoll {
 
 source classes/$player_source
 source misc/skill.sh
 
 player.statmod
 skill_anatomy=$[ $player_skill_anatomy / 9 ]
 bandaidhp=`echo $((($player_hp_modifier_increase / 6) + ($player_skill_healing / 2) + $skill_anatomy))`
 clear

if [[ $player_class == "Fencer" ]]; then
 player_skill_primary=$player_skill_fencing
elif [[ $player_class == "Swordsman" ]]; then
 player_skill_primary=$player_skill_swordsman
elif [[ $player_class == "Mace Fighter" ]]; then
 player_skill_primary=$player_skill_fencing
elif [[ $player_class == "Archer" ]]; then
 player_skill_primary=$player_skill_archery
elif [[ $player_class == "Mage" ]]; then
 player_skill_primary=$player_skill_magery
fi

 if [[ $player_skill_primary -lt 50 ]]; then
  player_skill_title="Apprentice"
 elif [[ $player_skill_primary -ge 50 && $player_skill_primary -lt 60 ]]; then
  player_skill_title="Journeyman"
 elif [[ $player_skill_primary -ge 60 && $player_skill_primary -lt 70 ]]; then
  player_skill_title="Novice"
 elif [[ $player_skill_primary -ge 70 && $player_skill_primary -lt 80 ]]; then
  player_skill_title="Adept"
 elif [[ $player_skill_primary -ge 80 && $player_skill_primary -lt 90 ]]; then
  player_skill_title="Skilled"
 elif [[ $player_skill_primary -ge 90 && $player_skill_primary -lt 100 ]]; then
  player_skill_title="Master"
 elif [[ $player_skill_primary -ge 100 ]]; then
  player_skill_title="Grand Master"
 fi

if [[ $player_fame -gt 3 ]]; then
 fame_division=$[ $player_fame / 3 ]
 if [[ $fame_division -lt 150 ]]; then
  player_align_title="Famed"
 elif [[ $fame_division -ge 150 && $fame_division -lt 450 ]]; then
  player_align_title="Honored"
 elif [[ $fame_division -ge 450 && $fame_division -lt 900 ]]; then
  player_align_title="Exalted"
 elif [[ $fame_division -ge 900 && $fame_division -lt 1500 ]]; then
  player_align_title="Lord"
 elif [[ $fame_division -ge 1500 ]]; then
  player_align_title="Glorious Lord"
 fi
else
  player_align_title=""
fi

 echo " "
 echo -e "                  ___________________
                 [ Character Profile ]
  +---------------------------------------------------+
  | Character Name: \033[1;37m$player_align_title $player_name\033[m,
  |\t\t\t \033[1;31m$player_skill_title $player_class\033[m
  +-[ ATTRIBUTES ]
  | +-- HP: \033[1;32m$player_hp\033[m\t\tMax HP: \033[1;32m$player_hp_modifier_increase\033[m (\033[1;32m$player_hp_cap\033[m+\033[1;32m$player_hp_modifier\033[m)
  | +-- Strength: \033[1;36m$player_strength\033[m\tIntelligence: \033[1;36m$player_intelligence\033[m
  | +-- Dexterity: \033[1;36m$player_dexterity\033[m\tStamina: \033[1;33m$player_stamina\033[m / \033[1;33m$player_stamina_cap\033[m
  |   +-- Attack: \033[1;31m$player_attack_total\033[m (+$player_attack_modifier)
  |   +-- Defense: \033[1;34m$player_defense_total\033[m (+$player_defense_modifier)
  |
  +-[ ITEMS ]
  | +-- Bandaids: \033[36m$player_item_bandaid\033[m \tBandaid Heal Amount: \033[1;32m$bandaidhp\033[m
  | +-- Arrows: \033[36m$player_item_arrow\033[m \tReagents: \033[36m$player_item_reagent\033[m
  | +-- Gold: \033[33m$player_item_gold\033[m
  | +-- Weapon: \033[35m$player_item_weapon_name\033[m \tDurability: \033[1;31m$player_item_weapon_durability\033[m / \033[1;31m$player_item_weapon_durability_cap\033[m 
  | +-- Armor
  |   +-- Helmet:   \033[35m$item_armor_head_name\033[m
  |   +-- Gorget:   \033[35m$item_armor_neck_name\033[m
  |   +-- Chest:    \033[35m$item_armor_torso_name\033[m
  |   +-- Sleeves:  \033[35m$item_armor_arms_name\033[m
  |   +-- Gloves:   \033[35m$item_armor_gloves_name\033[m
  |   +-- Leggings: \033[35m$item_armor_leggings_name\033[m
  |
  +-[ STATISTICS ]
  | +-- Deaths: $player_deaths
  | +-- Kill Count: $player_killcount
  |
  +---------------------------------------------------+"
 echo " "
 echo " Inventory Options: "
 select menusel in "Stat Lock" "Inventory" "Skills" "Bandaid($player_item_bandaid)" "Options" "Return to previous"; do
  case $menusel in
   "Stat Lock")
    statlock
    player.paperdoll ;;
   "Inventory")
    source misc/inventory.sh
    inventory 
    player.paperdoll ;;
   "Skills")
    skill.status ;;
   "Bandaid($player_item_bandaid)")
    bandaid
    player.paperdoll ;;
   "Options")
    clear
    optionsmenu
    player.paperdoll ;;
   "Return to previous")
    clear ;;
   *)
    player.paperdoll ;;
  esac
  break
 done
}
