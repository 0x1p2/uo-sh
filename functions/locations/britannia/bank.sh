#!/bin/bash

function britannia.bank {
 clear
 echo " "
 echo -e "Britannia's Bank,
   Store and Withdraw Items. "
 echo " "
 select menusel in "Store Items" "Withdraw" "Return to Britannia"; do
  case $menusel in
   "Store Items")
    echo " "
    echo " The bank is currently closed."
    pause
    britannia.bank ;;
   "Withdraw")
    echo " "
    echo " The bank is currently closed."
    pause
    britannia.bank ;;
   "Return to Britannia")
    britannia.towncenter ;;
   *)
    screwup
    britannia.bank ;;
  esac
 break
 done
}
