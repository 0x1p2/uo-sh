#!/bin/bash

# Created by: Ryan Ball
# Created: July 7th, 2013

# Variables
# Predetermined at every launch

britannia_discovered=0
felucca_discovered=0
despise_discovered=0
despise_discovered3=0
despise_discovered4=0

player_item_armor_repair=0
player_item_armor_upgrade=0
player_item_weapon_repair=0
player_item_weapon_upgrade=0

sourced_combat=0

defaultautospeed=3
autospeed=$defaultautospeed

skillbuff=0
player_special_effect_early=0

cd functions/
source misc/misc.sh

if [[ $1 == "" ]]; then
 echo -en "\n"
else
 player_name=$1
fi 

if [[ $2 == "" ]]; then
 class_skip=0
elif [[ $2 == "skip" ]]; then
 skip=1
 player.source
 britannia.towncenter
else
 class_skip=1
 tempclass=$2
fi


#if [[ -x /bin/usr/sha1sum ]]; then
# authenticate
#else
 script.start
#fi
