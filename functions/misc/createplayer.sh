#!/bin/bash

####################
#### Char Setup ####
####################

 #Fencing
player_item_own_dagger=0
player_item_own_kryss=0
player_item_own_rapier=0
player_item_own_warfork=0
 #Swordsman
player_item_own_longsword=0
player_item_own_broadsword=0
player_item_own_claymore=0
player_item_own_spear=0
player_item_own_glave=0
 #MaceFighter
player_item_own_club=0
player_item_own_mace=0
player_item_own_morningstar=0
player_item_own_maul=0
player_item_own_flail=0
 #Archer
player_item_own_bow=0
player_item_own_longbow=0
player_item_own_compositebow=0
player_item_own_repeatingcrossbow=0
#Mage
player_item_own_spellbook=0
player_item_own_wand=0
player_item_own_staff=0
player_item_own_spelltome=0
 #Armor
player_item_own_leather=0
player_item_own_dullcopper=0
player_item_own_shadowiron=0
player_item_own_copper=0
player_item_own_bronze=0
player_item_own_gold=0
player_item_own_agapite=0
player_item_own_verite=0
player_item_own_valorite=0

player_skill_focus=0
player_skill_meditation=0
player_skill_anatomy=0
player_skill_archery_status="ulocked"
player_skill_magery_status="ulocked"
player_skill_fencing_status="ulocked"
player_skill_swordsman_status="ulocked"
player_skill_macefighting_status="ulocked"
player_skill_healing_status="ulocked"
player_skill_tactics_status="ulocked"
player_skill_evalint_status="ulocked"
player_skill_focus_status="ulocked"
player_skill_meditation_status="ulocked"
player_skill_anatomy_status="ulocked"

item_enhance=none
item_enhance_stamina=0
item_enhance_stamina_cap=0
item_enhance_stamina_regeneration=0
item_enhance_defense=0
item_enhance_defense_range=0
item_enhance_attack=0
item_enhance_attack_range=0
item_enhance_speed=0
item_enhance_primary_skill=0
item_enhance_strength=0
item_enhance_intelligence=0
item_enhance_dexterity=0
player_item_enhancement=$item_enhance

function story.start {
 clear
 echo " "
 echo -e " You wake up underneath an apple tree. Around you are many
 corpses. You are confused and lost. You have no idea how you have 
 arrived here. You find a note in your pocket, it says:
  \\033[1;37m$player_name\\033[m."
 echo " "
 echo -e " By assumption, \033[1;37m$player_name\033[m is your name. Beside you
  you find a \033[1;35m$player_item_weapon_name\033[m. Upon picking up the \033[1;35m$player_item_weapon_name\033[m, are wrapped with
  memories of training with this weapon. You've slain many bore with
  this \033[1;35m$player_item_weapon_name\033[m. Memories of an elder man first-hand training you. You
  have no other recollection as to who this elder man is..."
 pause
 clear
 echo " "
 echo -e " You stand up and see smoke off to the distance. As you walk
  towards the unknown, you discover that it is a town. You enter the town."
 pause
 britannia.towncenter
}

function player.confirm {
 if [[ $player_new_status -le 0 ]]; then
  player_hp_cap=$[ $player_hp + 0 ]
  player_killcount=0
  player_deaths=0
  player_item_bandaid=3
  player_item_gold=500
  player_item_weapon_durability=$player_item_weapon_durability
  player_item_weapon_durability_cap=$player_item_weapon_durability
  player_item_armor_durability=$player_item_armor_durability
  player_item_armor_durability_cap=$player_item_armor_durability
  player_strength_status="open"
  player_intelligence_status="open"
  player_dexterity_status="open"
  player_stat_primary_status="open"
  player_stat_secondary_status="open"
  player_stat_triliminary_status="open"
  player_stamina=10
  player_stamina_regeneration=1
  player_stamina_cap=$player_stamina
  player_defense_buff=0
  player_fame=0
  source classes/$player_source
  player.statmod
 fi
 clear
 echo " "
 echo -en "                  ___________________
                 [ Character Profile ]
  +---------------------------------------------------+
  | Character Name: \033[1;37m$player_name\\033[m
  | +- Character Class: \\033[32m$player_class\\033[m
  |
  +-[ ATTRIBUTES ]
  | +-- HP: \\033[1;32m$player_hp\\033[m\t\tMax HP: \\033[1;32m$player_hp_modifier_increase\\033[m
  | +-- Strength: \\033[1;36m$player_strength\\033[m\tIntelligence: \\033[1;36m$player_intelligence\\033[m
  | +-- Dexterity: \\033[1;36m$player_dexterity\\033[m\tStamina: \\033[1;33m$player_stamina\\033[m / \\033[1;33m$player_stamina_cap\\033[m
  |   +-- Attack: \\033[1;31m$player_attack\\033[m 
  |   +-- Defense: \\033[1;34m$player_defense\\033[m
  |
  +-[ INVENTORY ]
  | +-- Arrows: \\033[36m$player_item_arrow\\033[m \tReagents: \\033[36m$player_item_reagent\\033[m
  | +-- Gold: \\033[33m$player_item_gold\\033[m 
  | +-- Weapon: \\033[1;35m$player_item_weapon_name\\033[m \tArmor: \033[1;35m$player_item_armor_name\033[m
  |   +-- Weapon Durability: \\033[1;31m$player_item_weapon_durability\\033[m / \\033[1;31m$player_item_weapon_durability_cap\\033[m
  |   +-- Armor Durability: \\033[1;34m$player_item_armor_durability\\033[m / \\033[1;34m$player_item_armor_durability_cap\\033[m
  +---------------------------------------------------+ 

  Is this correct? Option [y/n]: "
 read optyn
 if [[ $optyn = " " ]]; then
  optyn="y"
 fi
 if [[ $optyn = n || $optyn = N ]]; then
  player.classmenu
 fi
 story.start
}

function player.classmenu {
if [[ $class_skip == "0" ]]; then
 clear
 echo " "
 echo -e " Welcome traveler, \\033[1;37m$player_name\\033[m, you are about to begin a journey
  that will take you to a whole new world containing monsters, areas, and
  things that are unimaginable.
   Good Luck."
 echo " "
 echo -e " There are several classes to choose from. All in which have different
  attributes. Select the number that you would like for your character."
 echo " "
 select menusel in "Fencer" "Swordsman" "Mace Fighting" "Archer" "Mage" "Info" "Credits" "EXIT Program"; do
  case $menusel in
   "Fencer")
    source classes/fencer.sh
    class.basicstats
    clear ;;
   "Swordsman")
    source classes/swordsman.sh
    class.basicstats
    clear ;;
   "Mace Fighter")
    source classes/macefighter.sh
    class.basicstats
    clear ;;
   "Archer")
    source classes/archer.sh
    class.basicstats
    clear ;;
   "Mage")
    source classes/mage.sh
    class.basicstats
    clear ;;
   "Info")
    readme
    player.classmenu ;;
   "Credits")
    game.credits
    clear ;;
   "EXIT Program")
    clear && exit 0 ;;
   * )
    screwup
    clear ;;
  esac
  break
 done
else
 source classes/$tempclass.sh
 class.basicstats
fi
}
