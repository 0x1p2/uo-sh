#!/bin/bash

source spawns/monsters/ogre.sh

function map2z0 {

 if [[ $despise_discovered3 > 0 ]]; then
  hint3="( Left, Left, Right )"
 else
  hint3=""
 fi
 clear
 if [[ $completed = 0 ]]; then
  randomint=`randomgen`
  if [[ $randomint -le 70 ]]; then
   spawn.earthelemental
  elif [[ $randomint -gt 140 ]]; then
   spawn.ettin
  else
   spawn.ogre
  fi
  combatstage
  map2z0
 fi
 completed=0

 echo -e "
\n\t You've entered a very dark, lightly illuminated area of Despise.
 You are unsure where you are going and have no light to guide you.
       $hint3
"
 select menusel in "Walk In Area" "Left" "Right" "Info" "Paperdoll" "Return to Entrance"; do
  case $menusel in
   "Walk In Area")
    map2z0 ;;
   "Left")
    map2z1 ;;
   "Right")
    map2z2 ;;
   "Info")
    completed=1
    map2i ;;
   "Paperdoll")
    completed=1
    player.paperdoll ;;
   "Return to Entrance")
    map1z0 ;;
   *)
    screwup
    completed=1
    map2z0 ;;
  esac
  break
done
 map2z0
}

function map2z1 {
 clear
 if [[ $completed = 0 ]]; then
  randomint=`randomgen`
  if [[ $randomint -le 70 ]]; then
   spawn.earthelemental
  elif [[ $randomint -gt 140 ]]; then
   spawn.ettin
  else
   spawn.ogre
  fi
  combatstage
  map2z1
 fi
 completed=0

 echo -e "
\n\t You wander aimlessly throughout the cavern using the guidance of the
 cave walls to continue.
"
 select menusel in "Walk In Area" "Left" "Right" "Info" "Paperdoll" "Return to Entrance"; do
  case $menusel in
   "Walk In Area")
    map2z1 ;;
   "Left")
    map2z3 ;;
   "Right")
    map2z2 ;;
   "Info")
    completed=1
    map2i ;;
   "Paperdoll")
    completed=1
    player.paperdoll ;;
   "Return to Entrance")
    map1z0 ;;
   *)
    screwup
    completed=1
    map2z1 ;;
  esac
  break
done
 map2z1
}

function map2z2 {
 clear
 if [[ $completed = 0 ]]; then
  randomint=`randomgen`
  if [[ $randomint -le 70 ]]; then
   spawn.earthelemental
  elif [[ $randomint -gt 140 ]]; then
   spawn.ettin
  else
   spawn.ogre
  fi
  combatstage
  map2z2
 fi
 completed=0

 echo -e "
\n\t It is pitch black. You have no idea where you are going or where you came from.
  You continue to travel- trying to distinguish where you are.
"
 select menusel in "Walk In Area" "Left" "Right" "Info" "Paperdoll" "Return to Entrance"; do
  case $menusel in
   "Walk In Area")
    map2z2 ;;
   "Left")
    map2z1 ;;
   "Right")
    map2z3 ;;
   "Info")
    completed=1
    map2i ;;
   "Paperdoll")
    completed=1
    player.paperdoll ;;
   "Return to Entrance")
    map1z0 ;;
   *)
    screwup
    completed=1
    map2z2 ;;
  esac
  break
done
 map2z2
}

function map2z3 {
 clear
 if [[ $completed = 0 ]]; then
  randomint=`randomgen`
  if [[ $randomint -le 70 ]]; then
   spawn.earthelemental
  elif [[ $randomint -gt 140 ]]; then
   spawn.ettin
  else
   spawn.ogre
  fi
  combatstage
  map2z3
 fi
 completed=0

 echo -e "
\n\t You've been lost for some time now. You are unaware the current time of day. 
 You feel as if you've missed several meals while adventuring these caverns.
"
 select menusel in "Walk In Area" "Left" "Right" "Info" "Paperdoll" "Return to Entrance"; do
  case $menusel in
   "Walk In Area")
    map2z3 ;;
   "Left")
    map2z2 ;;
   "Right")
    map2z4 ;;
   "Info")
    completed=1
    map2i ;;
   "Paperdoll")
    completed=1
    player.paperdoll ;;
   "Return to Entrance")
    map1z0 ;;
   *)
    screwup
    completed=1
    map2z3 ;;
  esac
  break
done
 map2z3
}

function map2z4 { 
 clear
 completed=0
 despise_discovered3=1

 echo -e "
\n\t You've discovered a ladderwell that proceeds to go down
  into the third level of Despise. You are very weary due to knowing the
  challenges will only become more difficult.
"
 select menusel in "Walk In Area" "Left" "Right" "Level 3 - Despise" "Info" "Paperdoll" "Return to Entrance"; do
  case $menusel in
   "Walk In Area")
    map2z4 ;;
   "Left")
    map2z2 ;;
   "Right")
    map2z3 ;;
   "Level 3 - Despise")
    completed=1
    source locations/dungeons/despise/despise-level3.sh
    map3z0 ;;
   "Info")
    completed=1
    map2i ;;
   "Paperdoll")
    completed=1
    player.paperdoll ;;
   "Return to Entrance")
    map1z0 ;;
   *)
    screwup
    completed=1
    map2z4 ;;
  esac
  break
done
 map2z4
}
