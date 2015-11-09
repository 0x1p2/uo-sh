#!/bin/bash

function britannia.moongate {
 clear
 echo " "
 echo -e " Welcome to the Moongate.
   This is used to travel to other regions.
"
 select menusel in "Britannia" "Felucca" "Quit Game"; do
  case $menusel in
  "Britannia")
   britannia.towncenter ;;
  "Felucca")
   if [[ $fulucca_discovered = 1 ]]; then
    felucca.towncenter
   else
    echo "You have not discovered Felucca."
    pause
    britannia.moongate
   fi ;;
  "Quit Game")
   quitgame ;;
  * )
   echo " You screwed up, returning you to the moongate."
   pause
   britannia.moongate ;;
  esac
 break
done
}
