#!/bin/bash

#-------------------------------#
# Configuration File for Archer #
#-------------------------------#
player_item_quiver_limit=250
player_distance=$(($RANDOM%3 + 2))

#-----------------------#
# Character Basic Stats #
#-----------------------#
function class.basicstats {

 player_source=archer.sh
 player_class=Archer
 player_skill_primary_name=archery
 player_skill_primary=$player_skill_archery

 player_hp=55
 player_attack=2
 player_attack_range=3
 player_defense=2
 player_defense_range=2
 player_speed=4
 player_intelligence=10
 player_strength=25
 player_dexterity=35
 player_stamina_regeneration=2

 player_item_arrow=150
 player_item_reagent=150

 player_item_weapon=bow
 player_item_weapon_name="Bow"
 player_item_own_bow=1
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

 player_skill_archery=40
 player_skill_magery=0
 player_skill_fencing=0
 player_skill_swordsman=0
 player_skill_macefighting=0
 player_skill_healing=35
 player_skill_tactics=25
 player_skill_evalint=0


 player.confirm

}

#----------------------------------#
# Stat Mods for Combat and Profile #
#----------------------------------#
function player.statmod {

# source profiles/${player_name}/armorset
 source items/weapons/${player_item_weapon}.sh
 source items/enhancement/${player_item_enhancement}.sh

if [[ $player_item_weapon_class == "magery" ]]; then
 source classes/mage.sh
elif [[ $player_item_weapon_class == "fencing" ]]; then
 source classes/fencer.sh
elif [[ $player_item_weapon_class == "swordsman" ]]; then
 source classes/swordsman.sh
elif [[ $player_item_weapon_class == "macefighting" ]]; then
 source classes/macefighter.sh
fi

 player_stat_total=$[ $player_dexterity + $player_intelligence + $player_strength ]
 if [[ $player_stat_total -ge 0 && $player_stat_total -lt 90 ]]; then
  player_stamina_cap=10
 elif [[ $player_stat_total -ge 90 && $player_stat_total -lt 110 ]]; then
  player_stamina_cap=12
  player_stamina_regeneration=3
 elif [[ $player_stat_total -ge 110 && $player_stat_total -lt 135 ]]; then
  player_stamina_cap=14
 elif [[ $player_stat_total -ge 135 && $player_stat_total -lt 150 ]]; then
  player_stamina_cap=16
  player_stamina_regeneration=4
 elif [[ $player_stat_total -ge 150 && $player_stat_total -lt 175 ]]; then
  player_stamina_cap=18
 elif [[ $player_stat_total -ge 175 && $player_stat_total -lt 200 ]]; then
  player_stamina_cap=20
  player_stamina_regeneration=5
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

 player_skill_effect=$[ ($player_skill_archery / 8) + ($player_skill_tactics / 10) + ($player_skill_anatomy / 10) ]
 player_primary_modifier=$[ $player_dexterity / 7 ]
 player_secondary_modifier=$[ $player_strength / 10 ]
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
 npc.statmod
 
 echo " "
 echo -e " \\033[1;30m---------------------------------------------------------------\\033[m
  Your \tHP: \\033[1;32m$player_hp\\033[m / \\033[1;32m$player_hp_bar\\033[m\tStamina: \\033[1;33m$player_stamina\\033[m
  NPC \tHP: \\033[1;32m$npc_hp\\033[m / \\033[1;32m$npc_hp_cap\\033[m\tStamina: \\033[1;33m$npc_stamina\\033[m
 \\033[1;30m---------------------------------------------------------------\\033[m"
 interrupt=2
 read -sn 1 -t $autospeed -p  " Press '1' or [spacebar] to interrupt auto-attack... " interrupt
 if [[ $interrupt = 1 || $interrupt == " " ]]; then
 echo " "
 echo " "
  select menusel in "Continue" "$player_special_name1($player_special_stamina1)" "$player_special_name2($player_special_stamina2)" "$player_special_name3($player_special_stamina3)" "$player_special_name4($player_special_stamina4)" "$player_special_name5($player_special_stamina5)" "$player_special_name6($player_special_stamina6)" "$player_special_name7($player_special_stamina7)" "Use Bandaid($player_item_bandaid)" "Paperdoll" "Escape"; do
   case $menusel in
    "Continue")
     clear
     npc.alive.status ;;
    "$player_special_name1($player_special_stamina1)")
     player_special1
     player_special_flag=1
     npc.alive.status ;;
    "$player_special_name2($player_special_stamina2)")
     player_special2
     player_special_flag=1
     npc.alive.status ;;
    "$player_special_name3($player_special_stamina3)")
     player_special3
     player_special_flag=1
     npc.alive.status ;;
    "$player_special_name4($player_special_stamina4)")
     player_special4
     player_special_flag=1
     npc.alive.status ;;
    "$player_special_name5($player_special_stamina5)")
     player_special5
     player_special_flag=1
     npc.alive.status ;;
    "$player_special_name6($player_special_stamina6)")
     player_special6
     player_special_flag=1
     npc.alive.status ;;
    "$player_special_name7($player_special_stamina7)")
     player_special7
     player_special_flag=1
     npc.alive.status ;;
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
     npc.alive.status ;;
   esac
   break
  done
 else
  npc.alive.status
 fi
}



#---------------#
# Special Moves #
#---------------#
function player_special_move_list {

 player_special_name1="Second Shot"
 player_special_stamina1=4

 player_special_name2="Bleeding Arrow"
 player_special_stamina2=7

 player_special_name3="Pinpoint"
 player_special_stamina3=8

 player_special_name4="Quiver Release"
 player_special_stamina4=10

 player_special_name5="Explosion Arrow"
 player_special_stamina5=14

 player_special_name6="Feeble Arrow"
 player_special_stamina6=9

 player_special_name7="Retreat"
 player_special_stamina7=8

 function player_special1 {
  player_special_type=attack
  player_special_execute=player_special_flag1
  player_special_stamina=4
  player_special_name="Second Shot"
  function player_special_flag1 {
   player_damage=$[ $player_attack / 2 ]
   npc_hp=$[ $npc_hp - $player_damage ]
   player_speed_modifier=$[ $player_speed_modifier + 2 ]
   player_special_effect="fires a second shot [\033[1;33m$player_damage\033[m]"
  }
 }

 function player_special2 {
  player_special_type=attack
  player_special_execute=player_special_flag2
  player_special_name="Bleeding Arrow"
  player_special_dot_name="a barbed arrow."
  player_special_stamina=7
  function player_special_flag2 {
   player_special_dot_flag=$(($RANDOM%4 + 2))
   player_special_dot_damage=$[ $player_attack_modifier + 4 / 7 ]
   npc_hp=$[ $npc_hp - $player_special_dot_damage ]
  }
  player_special_effect="causes $npc_name to bleed and compulsively spasm"
 }

 function player_special3 {
  player_special_type=attack
  player_special_execute=player_special_flag3
  player_special_name="Pinpoint"
  player_special_stamina=8
  function player_special_flag3 {
   player_damage=$[ $player_attack / 2 + $player_attack ]
   npc_hp=$[ $npc_hp - $player_damage ]
  }
  player_special_effect="hits $npc_name with deadly accuracy and \033[1;33m$player_damage\033[m"
 }

 function player_special4 {
  player_special_execute=player_special_flag4
  player_special_type=attack
  player_special_name="Quiver Release"
  player_special_stamina=10
  player_special_effect_early=1
  player_special_effect="shoots a barrage of arrows"
  function player_special_flag4 {
   player_attack_special_amount=$((RANDOM%6 + 7))
   i=0
   for ((x=0; x<$player_attack_special_amount; x++))
    do
     i=$[ $i + 1 ]
     player_attack_special_damage=$((RANDOM%4 + 0))
     npc_hp=$[ $npc_hp - $player_attack_special_damage ]
     echo -e "  [\033[1;36m+\033[m]  It hit $npc_name for [\033[1;33m$player_attack_special_damage\033[m] damage."
     if [[ $player_item_arrow -le 0 || $player_attack_special_amount = $i ]]; then
      hhit=$[ $player_attack / 2 ]
      npc_hp=$[ $npc_hp - $hhit ]
      echo -e "  [\033[1;36m+\033[m]  $player_special_name's final hit for [\033[1;33m$hhit\033[m] damage."
      x=$player_attack_special_amount
      player_attack_special_amount=0
     fi
   done
   player_attack_special_amount=0
  }
 }

 function player_special5 {
  player_special_type=attack
  player_special_execute=player_special_flag5
  player_special_name="Explosion Arrow"
  player_special_stamina=14
  function player_special_flag5 {
   player_special_delay_name=$player_special_name
   player_special_delay_flag=1
   player_special_delay_spell_flag=1
   player_special_delay_damage=$[ $player_attack / 2 + $player_attack - 5 ]
   player_special_delay_spell_text="$player_special_delay_name \033[1;31mtriggers\033[m and causes [\033[1;33m$player_damage\033[m] damage"
  }
  player_special_effect="appears to have missed $npc_name"
 }

 function player_special6 {
  player_special_type=defense
  player_special_execute=player_special_flag6
  player_special_name="Feeble Arrow"
  player_special_stamina=9
  player_special_aura_counter_flag=2
  function player_special_flag6 {
   player_special_aura_flag=$(($RANDOM%2 + 2))
   npcbreak=1
   hindername="Feeble Arrow"
  }
  player_special_effect="causes $npc_name to be weakened"
 }

 function player_special7 {
  player_special_type=attack
  player_special_execute=player_special_flag7
  player_special_name="Retreat"
  player_special_stamina=8
  function player_special_flag7 {
   player_distance=$(($RANDOM%2 + 2 + $player_distance))
   player_special_effect="glances $npc_name, granting $player_name \033[1;34m$player_distance\033[m away from $npc_name"
  }
 }
}
