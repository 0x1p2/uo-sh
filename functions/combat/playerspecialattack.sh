#!/bin/bash

function player.special.dot.status {
 if [[ $player_special_dot_flag > 0 ]]; then
  player_special_dot_flag=$[ $player_special_dot_flag - 1 ]
  npc_hp=$[ $npc_hp - $player_special_dot_damage ]
  player_special_dot_damage=$player_special_dot_damage
  echo -e " [\033[1;36m+\033[m]  $npc_name suffers \\033[1;33m$player_special_dot_damage\\033[m damage from \\033[1;33m$player_special_dot_name\\033[m"
 fi
}

function player.special.attack.status {
 if [[ $player_special_type == "attack" ]]; then
  if [[ $player_special_flag > 0 ]]; then
   if [[ $player_stamina -ge $player_special_stamina ]]; then
    player_stamina=$[ $player_stamina - $player_special_stamina ]
    if [[ $player_special_effect_early = 1 ]]; then
     echo -e " [\\033[1;36m+\\033[m]  \\033[1;37m$player_name\\033[m uses \\033[1;33m$player_special_name\\033[m and it $player_special_effect."
     $player_special_execute
     player_special_flag=0
     player_special_effect_early=0
    else
     $player_special_execute
     echo -e " [\\033[1;36m+\\033[m]  \\033[1;37m$player_name\\033[m uses \\033[1;33m$player_special_name\\033[m and it $player_special_effect."
     player_special_flag=0
    fi
   else
    echo -e " [\\033[1;33m-\\033[m]  You do not have enough stamina."
    player_special_flag=0
   fi
   player_speed_modifier=$[ $player_speed + 0 ]
  fi
 fi
}

function player.special.delay.status {
 if [[ $player_special_delay_flag = 1 ]]; then
  if [[ $player_special_delay_spell_flag > 0 ]]; then
   player_special_delay_spell_flag=$[ $player_special_delay_spell_flag - 1 ]
  else
   npc_hp=$[ $npc_hp - $player_special_delay_damage ]
   echo -e " [\033[1;36m+\033[m]  $player_name $player_special_delay_spell_text"
   player_special_delay_flag=0
  fi
 fi
}

function player.special.armorignore.status {
 if [[ $armorignore < 1 ]]; then
  if [[ $player_attack_total -gt $npc_defense_total ]]; then
   player_damage=$[ $player_attack_total - $npc_defense_total ]
   npc_hp=$[ $npc_hp - $player_damage ]
   npc_defense_block=$[ $npc_defense_total - $player_attack_total ]
  else
   player_damage=$[ $npc_defense_total - $player_attack_total / 2 ]
   npc_hp=$[ $npc_hp - $player_damage ]
  fi
 else
  npc_hp=$[ $npc_hp - $player_damage ]
  npc_defense_total=0
  armorignore=$[ $armorignore - 1 ]
  if [[ $armorignore -le 0 ]]; then
   armorignore=0
  fi
 fi
}
