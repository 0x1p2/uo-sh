#!/bin/bash

function spawn.zombie {

 npc_name="Zombie"
 npc_source=zombie.sh
 npc_hp=28
 npc_hp_range=14

 npc_attack=7
 npc_attack_range=5
 npc_defense=5
 npc_defense_range=4
 npc_defense_buff=0

 npc_speed=1
 npc_strength=1
 npc_intelligence=1
 npc_dexterity=2
 npc_stamina=10
 npc_stamina_cap=$npc_stamina
 npc_stamina_regeneration=1

 npc_skill_wrestling=36
 npc_skill_magery=0

 npc_difficulty=2
 npc_fame=1

 npc_item_weapon="sharp sword"
 npc_item_gold=50
 npc_item_gold_range=50
}

function npc.statmod {

 npc_hp=$[ $npc_hp + 0 ]
 npc_hp_cap=$(($RANDOM%$npc_hp_range + $npc_hp))
 npc_hp_modifier=$[ $npc_strength * 10 ]
 npc_hp_modifier_increase=$[ $npc_hp_modifier + $npc_hp_cap ]

 npc_skill_effect=$[ $npc_skill_wrestling / 6 ]
 npc_dexterity_modifier=$[ $npc_dexterity * 2 ]
 npc_attack_modifier=$[ $npc_dexterity_modifier + $npc_strength + $npc_attack_range + $npc_dexterity ]
 npc_attack_total=$(($RANDOM%$npc_attack_modifier + $npc_attack + $npc_skill_effect))

 npc_defense_modifier=$[ $npc_dexterity + $npc_defense_range ]
 npc_defense_total=$(($RANDOM%$npc_defense_modifier + $npc_defense + $npc_defense_buff))

}


function npc.special.use {
 randomint=`randomgen`
}


function npc_special_move_list {
 npc.statmod

 npc_special_name1="Lightning"
 npc_special_stamina1=12

 function npc_special1 {
  npc_special_type=attack
  npc_special_execute=npc_special_flag1
  npc_special_stamina=12
  npc_special_name="Lightning"
  function npc_special_flag1 {
   spell.lightning
   npc_skill_effect=$[ $npc_skill_magery / 2 ]
   npc_special_attack_total=$[ $spell_effect + $npc_skill_effect ]
   player_hp=$[ $player_hp - ($npc_special_attack_total - $player_defense_total) ]
   npc_special_effect="shoots $player_name for [\033[1;33m$npc_special_attack_total\033[m] damage"
  }
 }
}
