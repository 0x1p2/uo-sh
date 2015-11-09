#!/bin/bash

function spawn.leviathan {

 npc_name="Leviathan"
 npc_source=leviathan.sh
 npc_hp=900100
 npc_hp_range=9001

 npc_attack=1
 npc_attack_range=2
 npc_defense=1
 npc_defense_range=2
 npc_defense_buff=0

 npc_speed=1
 npc_strength=1
 npc_intelligence=1
 npc_dexterity=1
 npc_stamina=25
 npc_stamina_cap=$npc_stamina
 npc_stamina_regeneration=3

 npc_skill_wrestling=35
 npc_skill_magery=50

 npc_difficulty=15
 npc_fame=15

 npc_item_weapon="claws"
 npc_item_gold=9001
 npc_item_gold_range=9001
}

function npc.statmod {

 npc_hp=$[ $npc_hp + 0 ]
 npc_hp_cap=$(($RANDOM%$npc_hp_range + $npc_hp))
 npc_hp_modifier=$[ $npc_strength * 10 ]
 npc_hp_modifier_increase=$[ $npc_hp_modifier + $npc_hp_cap ]

 npc_skill_effect=$[ $npc_skill_wrestling / 5 ]
 npc_intelligence_modifier=$[ $npc_intelligence * 2 ]
 npc_attack_modifier=$[ $npc_intelligence_modifier + $npc_strength + $npc_attack_range + $npc_dexterity ]
 npc_attack_total=$(($RANDOM%$npc_attack_modifier + $npc_attack + $npc_skill_effect))

 npc_defense_modifier=$[ $npc_dexterity + $npc_defense_range ]
 npc_defense_total=$(($RANDOM%$npc_defense_modifier + $npc_defense + $npc_defense_buff))

}


function npc.special.use {
 randomint=`randomgen`
 npc_stamina=$[ $npc_stamina + 0 ]
 #200 max
 if [[ $randomint -ge 0 ]]; then
  if [[ $npc_stamina -gt $npc_special_stamina1 ]]; then
   npc_stamina=$[ $npc_stamina - $npc_special_stamina1 ]
   npc_special1
   npc_special_flag=1
  fi
 fi
}

 
function npc_special_move_list {

 npc_special_name1="Fire Ball"
 npc_special_stamina1=5

 function npc_special1 {
  npc_special_type=attack
  npc_special_execute=npc_special_flag1
  npc_special_stamina=5
  npc_special_name="Fire Ball"
  function npc_special_flag1 {
   npc_special_attack_total=$[ $npc_attack_total * 2 ]
   player_hp=$[ $player_hp - $npc_special_attack_total ]
   npc_special_effect="shoots $player_name for [\033[1;33m$npc_special_attack_total\033[m] damage"
  }
 }
}
