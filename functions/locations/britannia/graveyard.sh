#!/bin/bash

function britannia.graveyard {
 clear
 echo " "
 randomint=`randomgen`
 echo " Welcome to the Britannia Graveyard. "
 echo " "
 if [[ $despise_discovered = 1 ]]; then
  select menusel in "Continue to Graveyard" "Go to Despise" "Return to Britannia"; do
   case $menusel in
    "Continue to Graveyard")
     if [[ $randomint -lt 150 ]]; then
      britannia.graveyard.spawn2
     else
      britannia.graveyard.spawn1
     fi ;;
    "Go to Despise")
     source locations/britannia/despise.sh
     britannia.despise ;;
    "Return to Britannia")
     britannia.towncenter ;;
    *)
     echo " "
     echo " You screwed up, returning you to the menu."
     pause
     britannia.graveyard ;;
   esac
  break
 done
 else
  select menusel in "Continue to Graveyard" "Back to Britannia"; do
   case $menusel in
    "Continue to Graveyard")
     if [[ $randomint -gt 140 ]]; then
      source locations/britannia/despise.sh
      britannia.despise
     elif [[ $randomint -lt 40 ]]; then
      britannia.graveyard.spawn1
     else
      britannia.graveyard.spawn2
     fi ;;
    "Back to Britannia")
     britannia.towncenter ;;
   esac
  break
 done
 fi
britannia.graveyard
}

function britannia.graveyard.spawn1 {
 randomint=`randomgen`
 if [[ $randomint -lt 80 ]]; then
  source spawns/monsters/wraith.sh
  spawn.wraith
 elif [[ $randomint -gt 110 ]]; then
  source spawns/monsters/spectre.sh
  spawn.spectre
 else
  source spawns/monsters/shade.sh
  spawn.shade
 fi
 combatstage
}

function britannia.graveyard.spawn2 {
 randomint=`randomgen`
 if [[ $randomint -lt 80 ]]; then
  source spawns/monsters/skeleton.sh
  spawn.skeleton
 elif [[ $randomint -gt 140 ]]; then
  source spawns/monsters/zombie.sh
  spawn.zombie
 else
  source spawns/monsters/ghoul.sh
  spawn.ghoul
 fi
 combatstage
}

