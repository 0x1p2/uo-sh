#!/bin/bash
#-------------------------------#
# Configuration File for Fencer #
#-------------------------------#
player_distance=0

#-----------------------#
# Character Basic Stats #
#-----------------------#
function class.basicstats {
 
 player_source=fencer.sh
 player_class=Fencer
 player_skill_primary_name=fencing
 player_skill_primary=$player_skill_fencing

 player_hp=65
 player_attack=3
 player_attack_range=2
 player_defense=2
 player_defense_range=2
 player_speed=4
 player_intelligence=10
 player_strength=25
 player_dexterity=35
 player_stamina_regeneration=2

 player_item_arrow=0
 player_item_reagent=0
 player_item_weapon=dagger
 player_item_weapon_name="Dagger"
 player_item_own_dagger=1
 player_item_armor=shadowiron
 player_item_armor_name="Shadow Iron"
 player_item_own_shadowiron=1

 source items/weapons/${player_item_weapon}.sh
 source items/armor/${player_item_armor}.sh
 $item_weapon_set
 $item_armor_set
 player_item_armor_durability_cap=$item_armor_durability
 player_item_armor_durability=$item_armor_durability_cap
 player_item_weapon_durability_cap=$item_weapon_durability
 player_item_weapon_durability=$item_weapon_durability_cap

 player_skill_archery=0
 player_skill_magery=0
 player_skill_fencing=40
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

 source items/armor/${player_item_armor}.sh
 source items/weapons/${player_item_weapon}.sh
 source items/enhancement/${player_item_enhancement}.sh

if [[ $player_item_weapon_class == "magery" ]]; then
 source classes/mage.sh
elif [[ $player_item_weapon_class == "archery" ]]; then
 source classes/archer.sh
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

 player_skill_effect=$[ ($player_skill_fencing / 8) + ($player_skill_tactics / 10) + ($player_skill_anatomy / 10) ]
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
  select menusel in "Continue" "$player_special_name1($player_special_stamina1)" "$player_special_name2($player_special_stamina2)" "$player_special_name3($player_special_stamina3)" "$player_special_name4($player_special_stamina4)" "$player_special_name5($player_special_stamina5)" "$player_special_name6($player_special_stamina6)" "Use Bandaid($player_item_bandaid)" "Paperdoll" "Escape"; do
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

 player_special_name1="Apply Poison"
 player_special_stamina1=8

 player_special_name2="Apply Battle Dressing"
 player_special_stamina2=9

 player_special_name3="Hit Lower Defense"
 player_special_stamina3=10

 player_special_name4="Parry"
 player_special_stamina4=6

 player_special_name5="Quick Hits"
 player_special_stamina5=6

 player_special_name6="Lunge"
 player_special_stamina6=4

 function player_special1 {
  player_special_execute=player_special_flag1
  player_special_type=attack
  player_special_stamina=8
  player_special_name="Apply Poison"
  function player_special_flag1 {
   player_special_dot_name="applied poison."
   player_special_dot_flag=$(($RANDOM%3 + 3))
   player_special_dot_damage=$[ $player_attack_modifier + 3 / 7 ]
   npc_hp=$[ $npc_hp - $player_special_dot_damage ]
  }
  player_special_effect="applied a noxious substance into $npc_name's open wound" 
 }

 function player_special2 {
  player_special_execute=player_special_flag2
  player_special_type=attack
  player_special_stamina=9
  player_special_name="Apply Battle Dressing"
  function player_special_flag2 {
   pskillgain
   battledressingamount=$[ $player_hp_modifier_increase / 2 ]
   player_hp=$[ $player_hp + $battledressingamount ]
   if [[ $player_hp -gt $player_hp_modifier_increase ]]; then
    overheal=$[ $player_hp - $player_hp_modifier_increase ]
    player_hp=$player_hp_modifier_increase
   else
    overheal=0
   fi
   player_special_effect="heals \\033[1;37m$player_name\\033[m for \\033[1;32m$battledressingamount\\033[m [\\033[1;32m$overheal\\033[m overheal]"
  }
 }

 function player_special3 {
  player_special_execute=player_special_flag3
  player_special_type=attack
  player_special_name="Hit Lower Defense"
  player_special_stamina=10
  function player_special_flag3 {
   armorignore=$(($RANDOM%4 + 2))
  }
  player_special_effect="pierces $npc_name's armor bypassing defense"
 }

 function player_special4 {
  player_special_execute=player_special_flag4
  player_special_type=defense
  player_special_aura_counter_flag=1
  player_special_stamina=6
  player_special_aura_flag=$(($RANDOM%4 + 2))
  player_special_name="Parry"
  player_special_aura_counter_name="Parry"
  function player_special_flag4 {
   player_special_effect="parrying $npc_name attack"
  }
 }

 function player_special5 {
  player_special_execute=player_special_flag5
  player_special_type=attack
  player_special_name="Quick Hits"
  player_special_stamina=6
  player_special_effect_early=1
  player_special_effect="releases rapid hits onto $npc_name"
  function player_special_flag5 {
   player_attack_special_amount=$((RANDOM%6 + 7))
   i=0
   for ((x=0; x<$player_attack_special_amount; x++))
    do
     i=$[ $i + 1 ]
     player_attack_special_damage=$((RANDOM%4 + 0))
     npc_hp=$[ $npc_hp - $player_attack_special_damage ]
     echo -e "  [\033[1;36m+\033[m]  It hit $npc_name for [\033[1;33m$player_attack_special_damage\033[m] damage."
     if [[ $player_attack_special_amount = $i ]]; then
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

 function player_special6 {
  player_special_type=attack
  player_special_execute=player_special_flag6
  player_special_stamina=4
  player_special_name="Lunge"
  function player_special_flag6 {
   player_damage=$[ ($player_attack + $item_weapon_attack) * 2 ]
   npc_hp=$[ $npc_hp - $player_damage ]
   player_speed_modifier=$[ $player_speed_modifier + 2 ]
   player_special_effect="inflicts damage to $npc_name for [\033[1;33m$player_damage\033[m] damage"
  }
 }
} 
