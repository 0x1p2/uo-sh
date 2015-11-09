#!/bin/bash

function britannia.despise {

 source locations/dungeons/despise/despise.sh
 source locations/dungeons/despise/despise.map

 clear
 echo " "
 if [[ $despise_discovered = 1 ]]; then
  map1z0
 else
  despise_discovered=1
  echo -en " You've wandered out of the graveyard. You decide
   follow a mountain path that leads you to a cave with a silk-like
   waterfall dripping over the covering. After stepping through the
   blanket of water, you push aside the moss that laid hidden behind it.
   Only to discover Despise.

  [\033[1;36m+\033[m]  Dungeon Dispise discovered.
 
     Would you like to enter Despise [yes]: "
  read yesno
  if [[ $yesno = Y || $yesno = y || $yesno == "yes" || $yesnot == "Yes" || $yesno == "" ]]; then
   map1z0
  fi
 fi
}
