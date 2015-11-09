#!/bin/bash

source spawns/monsters/ogrelord.sh

function map3z0 {
 if [[ $despise_discovered4 > 0 ]]; then
  hint4="( Right, Left, Left - to Ogre Lords )"
 else
  hint4=""
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
  map3z0
 fi
 completed=0

 echo -e "\n\n\t Upon venturing down the ladder well you are rewarded with
 an open cavern. In the distance you see faint outlines of figures. You 
 are unsure as to what these figures are but continue to progress in 
 Despise - Level 3
    $hint4
"
 select menusel in "Walk In Area" "Left" "Right" "Info" "Paperdoll" "Return to Entrance"; do
  case $menusel in
   "Walk In Area")
    map3z0 ;;
   "Left")
    map3z2 ;;
   "Right")
    map3z1 ;;
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
    map3z0 ;;
  esac
  break
done
 map3z0
}

function map3z1 {
 clear
 if [[ $completed = 0 ]]; then
  randomint=`randomgen`
  if [[ $randomint -le 120 ]]; then
   spawn.ogre
  elif [[ $randomint -gt 140 ]]; then
   spawn.ettin
  else
   spawn.lizardman
  fi
  combatstage
  map3z1
 fi
 completed=0

 echo -e "\n\t You've entered a very dark, lightly illuminated area of Despise.
 You are unsure where you are going and have no light to guide you.
"
 select menusel in "Walk In Area" "Left" "Right" "Info" "Paperdoll" "Return to Entrance"; do
  case $menusel in
   "Walk In Area")
    map3z1 ;;
   "Left")
    map3z3 ;;
   "Right")
    map3z2 ;;
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
    map3z1 ;;
  esac
  break
done
 map3z1
}

function map3z2 {
 clear
 if [[ $completed = 0 ]]; then
  randomint=`randomgen`
  if [[ $randomint -le 70 ]]; then
   spawn.ogre
  elif [[ $randomint -gt 140 ]]; then
   spawn.ettin
  else
   spawn.earthelemental
  fi
  combatstage
  map3z2
 fi
 completed=0

 echo -e "\n\t You've entered a very dark, lightly illuminated area of Despise.
 You are unsure where you are going and have no light to guide you.
"
 select menusel in "Walk In Area" "Left" "Right" "Info" "Paperdoll" "Return to Entrance"; do
  case $menusel in
   "Walk In Area")
    map3z2 ;;
   "Left")
    map3z3 ;;
   "Right")
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
    map3z2 ;;
  esac
  break
done
 map3z2
}

function map3z3 {
 clear
 if [[ $completed = 0 ]]; then
  randomint=`randomgen`
  if [[ $randomint -le 70 ]]; then
   spawn.ogre
  elif [[ $randomint -gt 140 ]]; then
   spawn.ettin
  else
   spawn.earthelemental
  fi
  combatstage
  map3z3
 fi
 completed=0

 echo -e "\n\t You've entered a very dark, lightly illuminated area of Despise.
 You are unsure where you are going and have no light to guide you.
"
 select menusel in "Walk In Area" "Left" "Right" "Info" "Paperdoll" "Return to Entrance"; do
  case $menusel in
   "Walk In Area")
    map3z3 ;;
   "Left")
    completed=1
    map3z4 ;;
   "Right")
    map3z2 ;;
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
    map3z3 ;;
  esac
  break
done
 map3z3
}

function map3z4 { 
 clear
 if [[ $completed = 0 ]]; then
  randomint=`randomgen`
  if [[ $randomint -le 60 ]]; then
   spawn.ogre
  else
   spawn.ogrelord
  fi
  combatstage
  map3z4
 fi
 completed=0
 despise_discovered4=1
 echo -e "
\n\t You are in a circular ring after just crossing a rope bridge. Ogres that
 stand double the height of your average ogre surround you. You have made it 
 to the Ogre Lord's lair. This is their hunting ground. You notice that normal
 Ogres are consistantly paying tribute to these \"Higher\" intelligence beings.
"
 select menusel in "Walk In Area" "Leave" "Info" "Paperdoll" "Return to Entrance"; do
  case $menusel in
   "Walk In Area")
    map3z4 ;;
   "Leave")
    map3z3 ;;
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
    map3z4 ;;
  esac
  break
done
 map3z4
}
