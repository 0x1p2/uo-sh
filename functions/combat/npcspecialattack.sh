#!/bin/bash
function npc.special.attack.status {

 player.statmod
 npc.statmod

 if [[ $npc_special_type == "attack" ]]; then
  if [[ $npc_special_flag > 0 ]]; then
  $npc_special_execute
  echo -e "  [\033[1;31m-\033[m]  $npc_name uses \033[1;31m$npc_special_name\033[m and it $npc_special_effect."
  npc_special_flag=0
  fi
 fi
}


function npc.special.delay.status {
 if [[ $npc_special_delay_flag = 1 ]]; then
  if [[ $npc_special_delay_spell_flag > 0 ]]; then
   npc_special_delay_spell_flag=$[ $npc_special_delay_spell_flag - 1 ]
  else
   player_hp=$[ $player_hp - ($npc_special_delay_damage / 2) ]
   echo -e "  [\033[1;31m-\033[m]  $npc_name $npc_special_delay_text "
   npc_special_delay_flag=0
   npc_special_flag=0
  fi
 fi

}
