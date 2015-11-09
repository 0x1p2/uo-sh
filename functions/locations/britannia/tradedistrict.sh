#!/bin/bash

source misc/store/buyitem.sh
source locations/britannia/provisioners.sh
source locations/britannia/blacksmith.sh

function britannia.tradedistrict {
 clear
 echo " "
 echo -e " Trade District
   Blacksmith   - Armor and Weapons
   Provisioners - Basic needs "
 echo " "
 select menusel in "Blacksmith" "Provisioners" "Return to Britannia"; do
  case $menusel in
   "Blacksmith")
    britannia.blacksmith ;;
   "Provisioners")
    britannia.provisioners ;;
   "Return to Britannia")
    britannia.towncenter ;;
   *)
    screwup
    britannia.tradedistrict ;;
  esac
 break
 done
 pause
}
