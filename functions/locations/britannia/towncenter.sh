#!/bin/bash

function britannia.towncenter {
 britannia_discovered=1
 clear
 echo " "
 echo -e " Welcome to Britannia. This town has existed for many years,
  and survived many wars. There are several places to choose from: "
 echo -e "\t\\033[1;37m$player_name\\033[m's HP: \\033[1;32m$player_hp\\033[m\tGold Total: \\033[33m$player_item_gold\\033[m"
 echo " "
 select menusel in "Paperdoll" "Bank" "Trade District" "Graveyard" "Trammel" "Moongate" "Arena" "README" "Quit Game"; do
  case $menusel in
   "Paperdoll")
    source misc/paperdoll.sh
    player.paperdoll;;
   "Bank")
    source locations/britannia/bank.sh
    britannia.bank ;;
   "Trade District")
    source locations/britannia/tradedistrict.sh
    britannia.tradedistrict ;;
   "Graveyard")
    source locations/britannia/graveyard.sh
    britannia.graveyard ;;
   "Trammel")
    source locations/trammel/trammel.sh
    trammel ;;
   "Moongate")
    source locations/britannia/moongate.sh
    britannia.moongate ;;
   "Arena")
    source locations/britannia/testarena.sh
    britannia.testarena ;;
   "README")
    readme ;;
   "Quit Game")
    source misc/misc.sh
    quitgame ;;
   * )
    echo " "
    echo -e " [\\033[1;33m-\\033[m]  You screwed up, resetting menu."
    echo " "
    pause
    britannia.towncenter
   esac
  break
 done
britannia.towncenter
}
