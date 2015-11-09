#!/bin/bash

function player.source {
source profiles/"${player_name}"/configs
source profiles/"${player_name}"/skills
source profiles/"${player_name}"/items
#source profiles/"${player_name}"/armorset
source profiles/"${player_name}"/lookup
}

