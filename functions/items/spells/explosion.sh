#!/bin/bash

function spell.explosion {

 spell_type=fire
 spell_attack=14
 spell_attack_range=6
 spell_effect=$(($RANDOM%$spell_attack_range + $spell_attack))

 npc_special_delay_flag=1  		#turns until casted.
 npc_special_delay_spell_flag=1  	#prevents unneeded text
 npc_special_delay_name="Explsion"
 npc_special_is=1

}

