#!/bin/bash

source spawns/monsters/leviathan.sh
source spawns/monsters/shade.sh

function arena.fight {
 clear
 spawn.leviathan
 combatstage
 arena.monsters
}

function arena.monsters {
 clear
 echo " "
 echo -e "
  Welcome to the test arena!
    Select and option below to perform...
"
 select menusel in "Fight" "Inventory" "Return to Britannia"; do
  case $menusel in
   "Fight")
    arena.fight ;;
   "Inventory")
    player.paperdoll ;;
   "Return to Britannia")
    britannia.towncenter ;;
   *)
    screwup
    arena.monsters ;;
  esac
  break
done
arena.monsters
}
