#!/bin/bash
#-----------------------------#
# Configuration file for Mage #
#-----------------------------#

player_distance=$(($RANDOM%3 + 2))

#-----------------------#
# Character Basic Stats #
#-----------------------#
function class.basicstats {
 
 player_source=mage.sh
 player_class=Mage
 player_skill_primary_name=magery
 player_skill_primary=$player_skill_magery

 player_hp=55
 player_attack=2
 player_attack_range=3
 player_defense=1
 player_defense_range=2
 player_speed=3
 player_intelligence=40
 player_strength=15
 player_dexterity=10
 player_stamina_cap=15
 player_stamina_regeneration=2

 player_item_arrow=0
 player_item_reagent=50

 player_item_weapon=spellbook
 player_item_weapon_name="Spell Book"
 player_item_own_spellbook=1
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
 player_skill_magery=40
 player_skill_fencing=0
 player_skill_swordsman=0
 player_skill_macefighting=0
 player_skill_healing=15
 player_skill_tatics=0
 player_skill_evalint=25 

 player.confirm

}


#----------------------------------#
# Stat Mods for Combat and Profile #
#----------------------------------#
function player.statmod {

 source items/weapons/${player_item_weapon}.sh
 source items/enhancement/${player_item_enhancement}.sh

 if [[ $player_item_weapon_class == "archery" ]]; then
  source classes/archer.sh
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
  player_stamina_regeneration=2
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
 player_skill_regeneration=$[ $player_skill_meditation / 24 ]
 player_stamina_regeneration_temp=$[ $player_stamina_regeneration + $item_enhance_stamina_regeneration + $player_skill_regeneration ]

 player_skill_effect=$[ ($player_skill_magery / 8) + ($player_skill_evalint / 10)+ ($player_skill_anatomy / 10) ]
 player_primary_modifier=$[ $player_intelligence / 4 ]
 player_secondary_modifier=0
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
  select menusel in "Continue" "$player_special_name1($player_special_stamina1)" "$player_special_name2($player_special_stamina2)" "$player_special_name3($player_special_stamina3)" "$player_special_name4($player_special_stamina4)" "$player_special_name5($player_special_stamina5)" "Use Bandaid($player_item_bandaid)" "Paperdoll" "Escape"; do
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

 player_special_name1="Greater Heal (In Vas Mani)"
 player_special_stamina1=8

 player_special_name2="Blessed Armor"
 player_special_stamina2=7

 player_special_name3="Fire Ball"
 player_special_stamina3=4
 
 player_special_name4="Explosion"
 player_special_stamina4=8

 player_special_name5="Teleport"
 player_special_stamina5=8

 function player_special1 {
  player_special_execute=player_special_flag1
  player_special_type=attack
  player_special_stamina=9
  player_special_name="Greater Heal (In Vas Mani)"
  function player_special_flag1 {
   pskillgain
   greaterhealamount=$[ $player_hp_modifier_increase / 2 * 3 ]
   player_hp=$[ $player_hp + $greaterhealamount ]
   if [[ $player_hp -gt $player_hp_modifier_increase ]]; then
    overheal=$[ $player_hp - $player_hp_modifier_increase ]
    player_hp=$player_hp_modifier_increase
   else
    overheal=0
   fi
   player_special_effect="heals \\033[1;37m$player_name\\033[m for \\033[1;32m$greaterhealamount\\033[m [\\033[1;32m$overheal\\033[m overheal]"
  }
 }

 function player_special2 {
  player_special_execute=player_special_flag2
  player_special_type=defense
  player_special_name="Blessed Armor"
  player_special_stamina=7
  player_special_aura_flag=1
  function player_special_flag2 {
   pskillgain
   player_defense_buff=$[ $player_defense_modifier / 2 + $player_defense_modifier ]
   player_special_aura_flag=$(($RANDOM%4 + 2))
  }
  player_special_effect="placed a magical protective barrier"
 }

 function player_special3 {
  player_special_execute=player_special_flag3
  player_special_type=attack
  player_special_name="Fire Ball"
  player_special_stamina=4
  function player_special_flag3 {
   pskillgain
   player_damage=$[ ($player_attack + $item_weapon_attack) * 2 + 3 ]
   npc_hp=$[ $npc_hp - $player_damage ]
   player_speed_modifier=$[ $player_speed_modifier + 2 ]
  }
  player_special_effect="inflicted [\\033[1;33m$player_damage\\033[m] damage"
 }

 function player_special4 {
  player_special_execute=player_special_flag4
  player_special_type=attack
  player_special_name="Explosion"
  player_special_stamina=8
  function player_special_flag4 {
   player_special_delay_flag=1
   player_special_delay_spell_flag=1
   player_special_delay_damage=$[ $player_attack * 2 + $player_attack ]
   player_special_delay_spell_text="spell \033[1;31mEXPLOSION\033[m causes [\033[1;33m$player_damage\033[m] damage"
  }
  player_special_effect="appears to have no effect on $npc_name"
 }

 function player_special5 {
  player_special_type=attack
  player_special_execute=player_special_flag5
  player_special_name="Teleport"
  player_special_stamina=8
  function player_special_flag5 {
   pskillgain
   player_distance=$(($RANDOM%2 + 2 + $player_distance))
   player_special_effect="glances $npc_name, granting $player_name \033[1;34m$player_distance\033[m away from $npc_name"
  }
 }
}
