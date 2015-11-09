#!/bin/bash

function readme {

clear
echo -e "
 \033[1;36mULTIMA\033[m is a series of scripts developed to create
a MUD-like experience for people who enjoyed the MMORPG Ultima Online.
It was made to test the ability of BASH in creating a game that is
small in size and portable to most Out-of-Box linux distributions.

Select an option you would like to learn more about:
"


 select menusel in "Gameplay" "Classes" "Items" "Monsters" "Return to Menu"; do
  case $menusel in
   "Gameplay")
    readme.gameplay
    readme ;;
   "Classes")
    readme.classes
    readme ;;
   "Items")
    readme.items
    readme ;;
   "Monsters")
    readme.monsters
    readme ;;
   "Return to Menu")
    clear ;;
   *)
    readme ;;
  esac
  break
 done
}

function readme.gameplay {
clear
echo -e "
\033[1;36m THE Basics \033[m
 There are several nick-knacks that will make you game experience more enjoyable.
One of the most assisting is understanding the Paperdoll. The Paperdoll allows
you to get a visual outlook on your characters attributes.

Options in Paperdoll:
 \033[1;36mStat Lock\033[m
  Allows you to lock specific stats in order to increase the chances of leveling 
  others. These stats are: Strength, Intelligence, and Dexterity.
 \033[1;36mInventory\033[m
  Allows you to change out your weapons and armor. There are specific keycodes
  need to be typed in to make these changes. Items with an \033[1;31mX\033[m are items
  that are currently owned. Dashes indicate that they are not owned.
  \"head_leather\" (object_type) is the syntax that is needed to change weapons and armor.
 \033[1;36mSkills\033[m
  This option lets you view your skills and the status of them. Each skill has a maximum 
  of 120. Anything above 120 will not continue to grow.
 \033[1;36mBandaid\033[m
  Let's the player apply bandages to heal the player. A maximum of 3 bandages can be 
  applied at one time.
 
\033[1;36mTrade District\033[m
 Allows the player to purchase much needed items. Ammunition(Archer), Reagents(Mage),
 Armor/Weapon repairs, Weapons, and various pieces of armor are just some of the items.
"
pause
}
 

function readme.classes {
clear
echo -e "

 \033[1;36mArcher\033[m
  Ranged Class. Hits lower than most classes but has a wide range of skills to use.
  Beneficial as an opener but lacks defense for longer fights.
   \033[1;36mStat\033[m Priority:				\033[1;36mSkills\033[m:
    Dexterity: Attack and Defense		 Archery
    Strength: Attack and Health			 Tactics
    Intelligence: None				 Focus
 \033[1;36mMage\033[m
  Ranged Class. Hits higher than all other DPSs but has little to no Defense. This
  class is outfitted to attempt to stay at ranged away from monster.
   \033[1;36mStat\033[m Priority:				\033[1;36mSkills\033[m:
    Intelligence: Primary Attack booster.	 Magery
    Strength: Health.				 Meditation
    Dexterity: Minor Defense.			 Healing
 \033[1;36mFencer\033[m
  Melee Class. Quick and often first to hit, this class has a significant offense
  with a well-balanced defense.
   \033[1;36mStat\033[m Priority:				\033[1;36mSkills\033[m:
    Dexterity: Attack and Defense		 Fencing
    Strength: Attack and Health			 Tactics
    Intelligence: None				 Healing
 \033[1;36mSwordsman\033[m
  Melee Class. This is a middle-man for players who like the Fencer and Mace Fighter.
  Swordsman hits decent and can take a blow from monsters.
   \033[1;36mStat\033[m Priority:				\033[1;36mSkills\033[m:
    Strength: Attack and Health			 Swordsmanship
    Dexterity: Attack and Defense		 Tactics
    Intelligence: None				 Healing
 \033[1;36mMace Fighter\033[m
  Melee Class. This is the tank of all classes. Focused around defense to take heavy
  blows from monsters. The Mace Fighter doesn't hit like a bitch but it's pretty close.
  (Open-palm-slap)
   \033[1;36mStat\033[m Priority:				\033[1;36mSkills\033[m:
    Strength: Attack and Health			 Mace Fighting
    Dexterity: Attack and Defense		 Healing
    Intelligence: None				 Anatomy
"
pause
}

function readme.items {
clear
echo -e "

\033[1;36mItems\033[m
 Can be purchased from the Trade Districtcs within the town. Items can be used and/or
equiped from the Paperdoll -> Inventory option. Armor is broken up into 5 pieces and
weapons are a slight increase in damage. 
"
pause
}

function readme.monsters {
clear
echo -e "
\033[1;36mMonsters\033[m
 There are several monsters that relate to those that were in Ultime Online.
If you have every played the MMORPG than you will see some similarities such-as
amount health, hit damage, difficulty, and gold.

 Some monsters are equiped with specials much like the player. They use the same
stamina system as players and so they can not fire off a ton of spells or other 
specials to demolish a player. ADVICE: Pay close attention to their stamina bar
because you can sometime predict (once you become familar) a up and coming 
special attack.
"
pause
}


