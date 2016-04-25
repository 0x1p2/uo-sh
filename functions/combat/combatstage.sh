#!/bin/bash


function combatstage {

 if [[ ${sourced_combat} -lt 1 ]]; then
 	source misc/stat.sh
 	source skills/wepskill.sh
 	source skills/supskill.sh
 	source skills/miscskill.sh
 	source skills/anatomy.sh
 	source classes/$player_source
 	source spawns/monsters/$npc_source
	source combat/equipment.sh
 	source combat/c_status.sh
 	source combat/attack.sh
 	source combat/defend.sh
 	#source combat/equipment.sh
 	source combat/playerspecialattack.sh
 	source combat/playerspecialdefense.sh
 	source combat/npcspecialattack.sh
	sourced_combat=1
 fi

 player.statmod
 npc.statmod

 npc_special_move_list
 player_special_move_list

 randomint=`randomgen`
 completed=0
 roundnum=0
 npc_special_flag=0

 player_hp=$[ $player_hp + 0 ]
 player_special_flag=0
 player_special_aura_flag=0
 player_defense_buff=0

 npc_namespare=$npc_name
 npc_name=`echo -e "\\033[1;37m$npc_name\\033[m"`
 npc_hp=$[ $npc_hp_modifier_increase + 0 ]
 npc_hp_cap=$[ $npc_hp + 0 ]
 npc_stamina=$[ $npc_stamina + 0 ]
 npc_special_flag=0
 npc_special_aura_flag=0
 npc_defense_buff=0
 npc_distance=0
 npc_special_delay_spell_flag=0
 npc_special_delay_damage=0

 clear
 echo " "
 echo -e " You are approached by a \033[1;37m$npc_name\033[m weilding it's \033[36m$npc_item_weapon\033[m."
 echo " "
 sleep 1
 read -sn 1 -t 2 -p "  Continuing in 2 seconds..." voidvar
 npc_alive_status
 echo -e " [\033[1;36m+\033[m]  You now have a total of \033[33m$player_item_gold\033[m gold."
 pause
}

