#!/bin/bash
#------------------------------------#
# Configuration File for Macefighter #
#------------------------------------#
player_distance=0

#-----------------------#
# Character Basic Stats #
#-----------------------#
function class.basicstats {

 player_source=macefighter.sh
 player_class="Mace Fighter"
 player_skill_primary_name=macefighting
 player_skill_primary=$player_skill_macefighting

 player_hp=65
 player_attack=1
 player_attack_range=2
 player_defense=4
 player_defense_range=2
 player_speed=1
 player_intelligence=10
 player_strength=35
 player_dexterity=25

 player_item_arrow=0
 player_item_reagent=0
 player_item_weapon=club
 player_item_weapon_name="club"
 player_item_own_club=1
 source items/weapons/${player_item_weapon}.sh
 $item_weapon_set

 player_item_armor_head=head_leather
 player_item_armor_neck=neck_leather
 player_item_armor_arms=arms_leather
 player_item_armor_torso=torso_leather
 player_item_armor_gloves=gloves_leather
 player_item_armor_leggings=leggings_leather
 player_item_own_head_leather=1
 player_item_own_neck_leather=1
 player_item_own_arms_leather=1
 player_item_own_torso_leather=1
 player_item_own_gloves_leather=1
 player_item_own_leggings_leather=1
 source misc/armorset.sh
 $item_armor_set
 
# player_item_armor_durability_cap=$item_armor_durability
# player_item_armor_durability=$item_armor_durability_cap
# player_item_weapon_durability_cap=$item_weapon_durability
# player_item_weapon_durability=$item_weapon_durability_cap

 player_skill_archery=0
 player_skill_magery=0
 player_skill_fencing=0
 player_skill_swordsman=0
 player_skill_macefighting=40
 player_skill_healing=40
 player_skill_tactics=25
 player_skill_evalint=0

 player.confirm

}


#----------------------------------#
# Stat Mods for Combat and Profile #
#----------------------------------#
function player.statmod {

 source items/armor/${player_item_armor}.sh
 source items/weapons/${player_item_weapon}.sh
 source items/enhancement/${player_item_enhancement}.sh

if [[ $player_item_weapon_class == "magery" ]]; then
 source classes/mage.sh
elif [[ $player_item_weapon_class == "archery" ]]; then
 source classes/archer.sh
elif [[ $player_item_weapon_class == "fencing" ]]; then
 source classes/fencer.sh
elif [[ $player_item_weapon_class == "swordsman" ]]; then
 source classes/swordsman.sh
fi

 player_stat_total=$[ $player_dexterity + $player_intelligence + $player_strength ]
 if [[ $player_stat_total -ge 0 && $player_stat_total -lt 90 ]]; then
  player_stamina_cap=10
 elif [[ $player_stat_total -ge 90 && $player_stat_total -lt 110 ]]; then
  player_stamina_cap=12
  player_stamina_regeneration=2
 elif [[ $player_stat_total -ge 110 && $player_stat_total -lt 135 ]]; then
  player_stamina_cap=14
 elif [[ $player_stat_total -ge 135 && $player_stat_total -lt 150 ]]; then
  player_stamina_cap=16
  player_stamina_regeneration=3
 elif [[ $player_stat_total -ge 150 && $player_stat_total -lt 175 ]]; then
  player_stamina_cap=18
 elif [[ $player_stat_total -ge 175 && $player_stat_total -lt 200 ]]; then
  player_stamina_cap=20
  player_stamina_regeneration=4
 elif [[ $player_stat_total -ge 200 ]]; then
  player_stamina_cap=22
 fi

 $item_weapon_set
 $item_armor_set
 $item_enhance_set

 player_hp=$[ $player_hp + 0 ]
 player_hp_modifier=$[ $player_strength / 2 ]
 player_hp_modifier_increase=$[ $player_hp_modifier + $player_hp_cap ]

 player_stamina_cap_temp=$[ $player_stamina_cap + $item_enhance_stamina ]
 player_skill_regeneration=$[ $player_skill_focus / 30 ]
 player_stamina_regeneration_temp=$[ $player_stamina_regeneration + $item_enhance_stamina_regeneration + $player_skill_regeneration ]

 player_skill_effect=$[ ($player_skill_macefighting / 8) + ($player_skill_tactics / 10) + ($player_skill_anatomy / 10) ]
 player_primary_modifier=$[ $player_strength / 7 ]
 player_secondary_modifier=$[ $player_dexterity / 10 ]
 player_attack_modifier=$[ $player_primary_modifier + $player_secondary_modifier + $player_skill_effect + $item_weapon_attack_range + $player_attack_range ]
 player_attack_total=$(($RANDOM%$player_attack_modifier + $player_attack + $item_weapon_attack))

 player_defense_modifier=$[ ($player_dexterity / 10) + $player_defense_range + $item_armor_defense_range ]
 player_defense_total=$(($RANDOM%$player_defense_modifier + $player_defense + $item_armor_defense + $player_defense_buff))

}


#-------------------------------------------#
# player.postround called by combatstage.sh #
#-------------------------------------------#
function player.postround {
 player.statmod
 echo " "
 echo -e " \\033[1;30m-----------------------------------------------------\\033[m
  Your \tHP: \\033[1;32m$player_hp\\033[m / \\033[1;32m$player_hp_bar\\033[m\tStamina: \\033[1;33m$player_stamina\\033[m
  NPC \tHP: \\033[1;32m$npc_hp\\033[m / \\033[1;32m$npc_hp_cap\\033[m\tStamina: \\033[1;33m$npc_stamina\\033[m
 \\033[1;30m-----------------------------------------------------\\033[m"
 interrupt=2
 read -sn 1 -t $autospeed -p  " Press '1' or [spacebar] to interrupt auto-attack... " interrupt
 if [[ $interrupt = 1 || $interrupt == " " ]]; then
 echo " "
 echo " "
  select menusel in "Continue" "$player_special_name1($player_special_stamina1)" "$player_special_name2($player_special_stamina2)" "$player_special_name3($player_special_stamina3)" "Use Bandaid($player_item_bandaid)" "Paperdoll" "Escape"; do
   case $menusel in
    "Continue")
     clear
     npc_alive_status ;;
    "$player_special_name1($player_special_stamina1)")
     player_special1
     player_special_flag=1
     npc_alive_status ;;
    "$player_special_name2($player_special_stamina2)")
     player_special2
     player_special_flag=1
     npc_alive_status ;;
    "$player_special_name3($player_special_stamina3)")
     player_special3
     player_special_flag=1
     npc_alive_status ;;
    "Use Bandaid($player_item_bandaid)")
     bandaid
     clear
     player.postround ;;
    "Paperdoll")
     player.paperdoll ;;
    "Escape")
     echo " "
     echo " You run from the $npc_name."
     echo " "
     clear ;;
    *)
     npc_alive_status ;;
   esac
   break
  done
 else
  npc_alive_status
 fi
}


#---------------#
# Special Moves #
#---------------#
function player_special_move_list {

 player_special_name1="Parry Stance"
 player_special_stamina1=6

 player_special_name2="Heavy Blow"
 player_special_stamina2=7

 player_special_name3="Defensive Stance"
 player_special_stamina3=10

 function player_special1 {
  player_special_execute=player_special_flag1
  player_special_type=defense
  player_special_aura_counter_flag=1
  player_special_stamina=6
  player_special_aura_flag=$(($RANDOM%4 + 2))
  player_special_name="Parry Stance"
  player_special_aura_counter_name="Parry Stance"
  function player_special_flag1 {
   player_special_effect="parrying $npc_name attack"
  }
 }

 function player_special2 {
  player_special_execute=player_special_flag2
  player_special_type=attack
  player_special_name="Heavy Blow"
  player_special_stamina=7
  function player_special_flag2 {
   player_damage=$[ $player_attack / 2 ]
   npc_hp=$[ $npc_hp - $player_damage ]
   player_special_effect="causes [\\033[1;33m$player_damage\\033[m] damage"
   player_special_dot_name="a $player_special_name"
   player_special_dot_flag=1
   player_special_dot_damage=$[ $player_attack_modifier / 7 ]
   npc_hp=$[ $npc_hp - $player_special_dot_damage ]
  }
  player_special_effect="causes $npc_name to seep blood from the concussive blow."
 }

 function player_special3 {
  player_special_execute=player_special_flag3
  player_special_type=defense
  player_special_name="Defensive Stance"
  player_special_stamina=10
  function player_special_flag3 {
   player_special_aura_counter_flag=0
   player_special_aura_flag=$(($RANDOM%4 + 3))
   player_defense_buff=$[ $player_defense_modifier * 2 ]
   player_special_effect="positions into a defensive stance.\n\t Increasing defense by: \033[1;34m$player_defense_buff\033[m"

  }
 } 
}
