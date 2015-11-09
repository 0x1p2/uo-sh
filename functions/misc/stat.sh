#!/bin/bash

function statgain {

if [[ $item_weapon_class == "magery" ]]; then
 player_stat_primary=intelligence
 player_stat_secondary=strength
 player_stat_triliminary=dexterity
elif [[ $item_weapon_class == "archery" ]]; then
 player_stat_primary=dexterity
 player_stat_secondary=strength
 player_stat_triliminary=intelligence
elif [[ $item_weapon_class == "fencing" ]]; then
 player_stat_primary=dexterity
 player_stat_secondary=strength
 player_stat_triliminary=intelligence
elif [[ $item_weapon_class == "swordsman" ]]; then
 player_stat_primary=strength
 player_stat_secondary=dexterity
 player_stat_triliminary=intelligence
elif [[ $item_weapon_class == "macefighting" ]]; then
 player_stat_primary=strength
 player_stat_secondary=dexterity
 player_stat_triliminary=intelligence
fi

 player_stat_total=$[ $player_strength + $player_intelligence + $player_dexterity ]
 randomint=`randomgen`

 if [[ $player_stat_total -le 225 ]]; then
  if [[ $player_stat_total -lt 100 ]]; then
   player_stat_chance=32
  elif [[ $player_stat_total -ge 100 && $player_stat_total -lt 125 ]]; then
   player_stat_chance=16
  elif [[ $player_stat_total -ge 125 && $player_stat_total -lt 150 ]]; then
   player_stat_chance=8
  elif [[ $player_stat_total -ge 150 && $player_stat_total -lt 175 ]]; then
   player_stat_chance=4
  elif [[ $player_stat_total -ge 175 && $player_stat_total -lt 201 ]]; then
   player_stat_chance=2
  else
   player_stat_chance=1
  fi
 statgaincontrol
fi
}

function statgaincontrol {

 if [[ $randomint -le $player_stat_chance ]]; then
  gennum=`randomgen`
  if [[ $gennum -ge 67 ]]; then 
   if [[ $player_stat_primary_status == "open" ]]; then
    if [[ $player_stat_primary == "strength" ]]; then
     player_strength=$[ $player_strength + 1 ]
    elif [[ $player_stat_primary == "intelligence" ]]; then
     player_intelligence=$[ $player_intelligence + 1 ]
    else
     player_dexterity=$[ $player_dexterity + 1 ]
    fi
    echo -e " [\\033[1;36m+\\033[m]  \\033[1;33mYou gained [\\033[1;36m+1\\033[m\\033[1;33m] to [\\033[1;36m$player_stat_primary\\033[m\\033[1;33m]\\033[m"
     
   elif [[ $player_stat_secondary_status == "open" ]]; then
    if [[ $player_stat_secondary == "strength" ]]; then
     player_strength=$[ $player_strength + 1 ]
    elif [[ $player_stat_secondary == "intelligence" ]]; then
     player_intelligence=$[ $player_intelligence + 1 ]
    else
     player_dexterity=$[ $player_dexterity + 1 ]
    fi
    echo -e " [\\033[1;36m+\\033[m]  \\033[1;33mYou gained [\\033[1;36m+1\\033[m\\033[1;33m] to [\\033[m\\033[1;36m$player_stat_secondary\\033[m\\033[1;33m]\\033[m"
    
   elif [[ $player_stat_triliminary_status == "open" ]]; then
    if [[ $player_stat_triliminary == "strength" ]]; then
     player_strength=$[ $player_strength + 1 ]
    elif [[ $player_stat_triliminary == "intelligence" ]]; then
     player_intelligence=$[ $player_intelligence + 1 ]
    else
     player_dexterity=$[ $player_dexterity + 1 ]
    fi
    echo -e " [\\033[1;36m+\\033[m]  \\033[1;33mYou gained [\\033[1;36m+1\\033[m\\033[1;33m] to [\\033[m\\033[1;36m$player_stat_triliminary\\033[m\\033[1;33m]\\033[m"
    
   else
    echo -e " [\\033[1;33m-\\033[m]  \\033[1;33mYou missed out to [\\033[m\\033[1;36m+1\\033[m\\033[1;33m] on a skill due to locked status.\\033[m"
   fi
  else
   if [[ $player_stat_secondary_status == "open" ]]; then
    if [[ $player_stat_secondary == "strength" ]]; then
     player_strength=$[ $player_strength + 1 ]
    elif [[ $player_stat_secondary == "intelligence" ]]; then
     player_intelligence=$[ $player_intelligence + 1 ]
    else
     player_dexterity=$[ $player_dexterity + 1 ]
    fi
    echo -e " [\\033[1;36m+\\033[m]  \\033[1;33mYou gained [\\033[1;36m+1\\033[m\\033[1;33m] to [\\033[m\\033[1;36m$player_stat_secondary\\033[m\\033[1;33m]\\033[m"
 
   elif [[ $player_stat_triliminary_status == "open" ]]; then
    if [[ $player_stat_triliminary == "strength" ]]; then
     player_strength=$[ $player_strength + 1 ]
    elif [[ $player_stat_triliminary == "intelligence" ]]; then
     player_intelligence=$[ $player_intelligence + 1 ]
    else
     player_dexterity=$[ $player_dexterity + 1 ]
    fi
    echo -e " [\\033[1;36m+\\033[m]  \\033[1;33mYou gained [\\033[1;36m+1\\033[m\\033[1;33m] to [\\033[m\\033[1;36m$player_stat_triliminary\\033[m\\033[1;33m]\\033[m"
 
   else
    echo -e " [\\033[1;33m-\\033[m]  \\033[1;33mYou missed out to [\\033[m\\033[1;36m+1\\033[m\\033[1;33m] on a skill due to locked status.\\033[m"
   fi
  fi
 fi
}
