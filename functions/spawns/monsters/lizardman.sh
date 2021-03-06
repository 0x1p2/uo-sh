#!/bin/bash

function spawn.lizardman {

 npc_name="Lizardman"
 npc_source=lizardman.sh
 npc_hp=58
 npc_hp_range=14

 npc_attack=11
 npc_attack_range=8
 npc_defense=5
 npc_defense_range=7
 npc_defense_buff=0

 npc_speed=2
 npc_strength=3
 npc_intelligence=1
 npc_dexterity=4
 npc_stamina=12
 npc_stamina_cap=$npc_stamina
 npc_stamina_regeneration=2

 npc_skill_wrestling=39
 npc_skill_magery=0

 npc_difficulty=3
 npc_fame=1

 npc_item_weapon="rusty scimitar"
 npc_item_gold=50
 npc_item_gold_range=25
}

function npc.statmod {

 npc_hp=$[ $npc_hp + 0 ]
 npc_hp_cap=$(($RANDOM%$npc_hp_range + $npc_hp))
 npc_hp_modifier=$[ $npc_strength * 10 ]
 npc_hp_modifier_increase=$[ $npc_hp_modifier + $npc_hp_cap ]

 npc_skill_effect=$[ $npc_skill_wrestling / 5 ]
 npc_dexterity_modifier=$[ $npc_dexterity * 2 ]
 npc_attack_modifier=$[ $npc_strength + $npc_attack_range + $npc_dexterity_modifier ]
 npc_attack_total=$(($RANDOM%$npc_attack_modifier + $npc_attack + $npc_skill_effect))

 npc_defense_modifier=$[ $npc_dexterity + $npc_defense_range ]
 npc_defense_total=$(($RANDOM%$npc_defense_modifier + $npc_defense + $npc_defense_buff))

}


function npc.special.use {
 randomint=`randomgen`
 npc_stamina=$[ $npc_stamina + 0 ]
 #200 max
 if [[ $randomint -ge 140 ]]; then
  if [[ $npc_stamina -gt $npc_special_stamina1 ]]; then
   npc_stamina=$[ $npc_stamina - $npc_special_stamina1 ]
   npc_special1
   npc_special_flag=1
  fi
 fi
}


function npc_special_move_list {

 npc_special_name1="Quick-Hit"
 npc_special_stamina1=7

 function npc_special1 {
  npc_special_type=attack
  npc_special_execute=npc_special_flag1
  npc_special_stamina=7
  npc_special_name="Quick-Hit"
  function npc_special_flag1 {
   npc_special_attack_total=$[ $npc_attack_total / 8 + $npc_attack_total ]
   player_hp=$[ $player_hp - ( ($npc_special_attack_total - $player_defense_total) / 2) ]
   npc_special_effect="strikes $player_name for [\033[1;33m$npc_special_attack_total\033[m] damage"
  }
 }
}
