#!/bin/bash

function player.special.defense.status {
 if [[ $player_special_type == "defense" ]]; then
  if [[ $player_special_flag > 0 ]]; then
   if [[ $player_stamina -ge $player_special_stamina ]]; then
    player_stamina=$[ $player_stamina - $player_special_stamina ]
    $player_special_execute
    echo -e " [\033[1;36m+\033[m]  \\033[1;37m$player_name\\033[m uses \\033[1;33m$player_special_name\\033[m and it $player_special_effect."
    player_special_flag=0
   else
    echo -e " [\033[1;33m-\033[m]  You do not have enough \033[1;33mstamina\033[m."
    player_special_flag=0
   fi
   player_speed_modifier=$[ $player_speed + 0 ]
  fi
 fi
}


function player.special.aura.status {
 if [[ $player_special_aura_flag > 0 ]]; then
  if [[ $player_special_aura_counter_flag = 0 ]]; then
   player_special_aura_flag=$[ $player_special_aura_flag - 1 ]
   echo -e "  [\033[1;36m+\033[m]  \033[1;37m$player_name\033[m defense is temporarily increased."
  elif [[ $npcbreak = 1 ]]; then
   npc_attack_total=$[ $npc_attack_total / 2 ]
   echo -e "  [\033[31m-\033[m]  $npc_name is hindered by \033[1;33m$hindername\033[m."
  fi
 else
  player_defense_buff=0
  npcbreak=0
 fi
}
