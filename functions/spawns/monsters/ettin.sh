#!/bin/bash

function spawn.ettin {

 npc_name="Ettin"
 npc_source=ettin.sh
 npc_hp=82
 npc_hp_range=17

 npc_attack=12
 npc_attack_range=19
 npc_defense=7
 npc_defense_range=5
 npc_defense_buff=0

 npc_speed=1
 npc_strength=4
 npc_intelligence=1
 npc_dexterity=2
 npc_stamina=14
 npc_stamina_cap=$npc_stamina
 npc_stamina_regeneration=2

 npc_skill_wrestling=46
 npc_skill_magery=0

 npc_difficulty=3
 npc_fame=1

 npc_item_weapon="club"
 npc_item_gold=175
 npc_item_gold_range=50
}

function npc.statmod {

 npc_hp=$[ $npc_hp + 0 ]
 npc_hp_cap=$(($RANDOM%$npc_hp_range + $npc_hp))
 npc_hp_modifier=$[ $npc_strength * 10 ]
 npc_hp_modifier_increase=$[ $npc_hp_modifier + $npc_hp_cap ]

 npc_skill_effect=$[ $npc_skill_wrestling / 5 ]
 npc_strength_modifier=$[ $npc_strength * 2 ]
 npc_attack_modifier=$[ $npc_dexterity + $npc_attack_range + $npc_strength_modifier ]
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

 npc_special_name1="Pummel"
 npc_special_stamina1=7

 function npc_special1 {
  npc_special_type=attack
  npc_special_execute=npc_special_flag1
  npc_special_stamina=7
  npc_special_name="Pummel"
  function npc_special_flag1 {
   npc_special_attack_total=$[ $npc_attack_total / 2 ]
   player_hp=$[ $player_hp - ( ($npc_special_attack_total - $player_defense_total) / 2) ]
   npc_special_effect="pounds $player_name for [\033[1;33m$npc_special_attack_total\033[m] damage"
  }
 }
}
