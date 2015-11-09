#!/bin/bash

function spell.flamestrike {

 spell_type=fire
 spell_attack=14
 spell_attack_range=4
 spell_effect=$(($RANDOM%$spell_attack_range + $spell_attack))

}
