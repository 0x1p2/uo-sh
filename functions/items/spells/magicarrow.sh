#!/bin/bash

function spell.magicarrow {

 spell_type=fire
 spell_attack=4
 spell_attack_range=3
 spell_effect=$(($RANDOM%$spell_attack_range + $spell_attack))
}
