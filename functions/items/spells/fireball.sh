#!/bin/bash

function spell.fireball {

 spell_type=fire
 spell_attack=8
 spell_attack_range=6
 spell_effect=$(($RANDOM%$spell_attack_range + $spell_attack))

}
