#!/bin/bash

function spawn.shade {

 source items/spells/lightning.sh
 source items/spells/magicarrow.sh
 source items/spells/explosion.sh


 npc_name="Shade"
 npc_source=shade.sh
 npc_hp=46
 npc_hp_range=14

 npc_attack=5
 npc_attack_range=6
 npc_defense=5
 npc_defense_range=7
 npc_defense_buff=0

 npc_speed=2
 npc_strength=1
 npc_intelligence=3
 npc_dexterity=1
 npc_stamina=15
 npc_stamina_cap=$npc_stamina
 npc_stamina_regeneration=3

 npc_skill_wrestling=14
 npc_skill_magery=35

 npc_difficulty=3
 npc_fame=2

 npc_item_weapon="claws"
 npc_item_gold=50
 npc_item_gold_range=50
}

function npc.statmod {

 npc_hp=$[ $npc_hp + 0 ]
 npc_hp_cap=$(($RANDOM%$npc_hp_range + $npc_hp))
 npc_hp_modifier=$[ $npc_strength * 10 ]
 npc_hp_modifier_increase=$[ $npc_hp_modifier + $npc_hp_cap ]

 npc_skill_effect=$[ $npc_skill_wrestling / 6 ]
 npc_intelligence_modifier=$[ $npc_intelligence * 2 ]
 npc_attack_modifier=$[ $npc_intelligence_modifier + $npc_strength + $npc_attack_range + $npc_dexterity ]
 npc_attack_total=$(($RANDOM%$npc_attack_modifier + $npc_attack + $npc_skill_effect))

 npc_defense_modifier=$[ $npc_dexterity + $npc_defense_range ]
 npc_defense_total=$(($RANDOM%$npc_defense_modifier + $npc_defense + $npc_defense_buff))

}


function npc.special.use {
 randomint=`randomgen`
 npc_stamina=$[ $npc_stamina + 0 ]
 if [[ $randomint -lt 66 ]]; then
  if [[ $npc_stamina -gt $npc_special_stamina1 ]]; then
   npc_stamina=$[ $npc_stamina - $npc_special_stamina1 ]
   npc_special1
   npc_special_flag=1
  elif [[ $npc_stamina -gt $npc_special_stamina2 ]]; then
   npc_stamina=$[ $npc_stamina - $npc_special_stamina2 ]
   npc_special2
   npc_special_flag=1
  fi
 elif [[ $randomint -ge 66 && $randomint -lt 100 ]]; then
  if [[ $npc_stamina -gt $npc_special_stamina2 ]]; then
   npc_stamina=$[ $npc_stamina - $npc_special_stamina2 ]
   npc_special2
   npc_special_flag=1
  fi
 elif [[ $randomint -gt 170 ]]; then
  if [[ $npc_stamina -gt $npc_special_stamina3 ]]; then
   npc_stamina=$[ $npc_stamina - $npc_special_stamina3 ]
   npc_special3
   npc_special_flag=1
  fi
 fi
}


function npc_special_move_list {
 npc.statmod

 npc_special_name1="Lightning"
 npc_special_stamina1=12

 npc_special_name2="Magic Arrow"
 npc_special_stamina2=3

 npc_special_name3="Explosion"
 npc_special_stamina3=13

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

 function npc_special2 {
  npc_special_type=attack
  npc_special_execute=npc_special_flag2
  npc_special_stamina=3
  npc_special_name="Magic Arrow"
  function npc_special_flag2 {
   spell.magicarrow
   npc_skill_effect=$[ $npc_skill_magery / 2 ]
   npc_special_attack_total=$[ $spell_effect + $npc_skill_effect ]
   npc_special_reduction=$[ ($npc_special_attack_total - $player_defense_total) / 2 ]
   player_hp=$[ $player_hp - $npc_special_reduction ]
   npc_special_effect="shoots $player_name for [\033[1;33m$npc_special_reduction\033[m] damage"
  }
 }

 function npc_special3 {
  npc_special_type=attack
  npc_special_execute=npc_special_flag3
  npc_special_stamina=13
  npc_special_name="Explosion"
  npc_special_effect="begins to feel a little \033[1;31mwarm\033[m"
  function npc_special_flag3 {
   spell.explosion
   npc_skill_effect=$[ $npc_skill_magery / 2 ]
   npc_special_delay_damage=$[ ($spell_effect + $npc_skill_effect) - $player_defense_total ]
   npc_special_delay_flag=1
   npc_special_delay_spell_flag=1
   npc_special_delay_text="spell \033[1;31mEXPLOSION\033[m causes [\033[1;33m$npc_special_delay_damage\033[m] damage"
  }
 }
}
