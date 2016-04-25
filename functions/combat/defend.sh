#!/bin/bash

###################
# defend function #
function defend {

 miscskillgain
 player.special.defense.status
 player.special.aura.status
 player_equipment_defend_status

 player.statmod
 npc.statmod
 npc.special.use
 npc.special.attack.status
 npc.special.delay.status

 if [[ $npc_attack_total -gt $player_defense_total ]]; then
  npc_damage=$[ $npc_attack_total - $player_defense_total ]
  player_hp=$[ $player_hp - $npc_damage ]
  if [[ $player_hp -le 0 ]]; then
   player_hp=0
   echo -e " [\033[1;33m-\033[m]  \033[1;37m$npc_name\033[m has dealt \033[1;31m$npc_attack_total\033[m damage to you."
   echo -e " [\033[1;33m-\033[m]  You only have \033[1;32m$player_hp\033[m healthpoints left."
   pause
   player.alive.status
  fi
 else
  npc_attack_max=$[ ($npc_attack_range + $npc_attack) ]
  npc_attack_min=$[ ($npc_attack) / 2 ]
  npc_damage=$[ ($player_defense_total - $npc_attack_total) / $npc_attack_max + $npc_attack_min ]
  player_hp=$[ $player_hp - $npc_damage ]

  if [[ $player_hp -le 0 ]]; then
   player_hp=0
   echo -e " [\033[1;33m-\033[m]  \033[1;37m$npc_name\033[m has dealt \033[1;31m$npc_damage\033[m damage [\033[1;34m$player_defense_total\033[m of \033[1;34m$npc_attack_total\033[m was Blocked] to you."
   echo -e " [\033[1;33m-\033[m]  You only have \033[1;32m$player_hp\033[m healthpoints left."
   pause
   player.alive.status
  fi
 fi


 echo -e " [\033[1;33m-\033[m]  $npc_name has dealt \033[1;31m$npc_damage\033[m damage [\033[1;34m$player_defense_total\033[m of \033[1;34m$npc_attack_total\033[m was Blocked] to you."
 echo -e "  \033[1;33m+---\033[m (\033[36m$npc_attack_total\033[m with $npc_item_weapon)"


 if [[ $player_special_aura_flag > 0 ]]; then
  if [[ $player_special_aura_counter_flag = 1 ]]; then
   player_special_aura_flag=$[ $player_special_aura_flag - 1 ]
   player_damage=$[ $npc_damage / 3 ]
   npc_hp=$[ $npc_hp - $player_damage ]
   echo -e " [\033[1;36m+\033[m]  \033[1;37m$player_name\033[m causes \033[1;33m$player_damage\033[m damage to $npc_name by \033[1;33m$player_special_aura_counter_name.\033[3m"
  fi
 fi

 echo -e " [\033[1;33m-\033[m]  You only have \033[1;32m$player_hp\033[m healthpoints left."
 
 if [[ $player_attack_place = 1 ]]; then
  player.postround
 else
  attack
 fi
}
