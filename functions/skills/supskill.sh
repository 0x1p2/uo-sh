#!/bin/bash

function supskillgain {
 if [[ $item_weapon_class == "magery" ]]; then
  source skills/evalint.sh
  skillgain.evalint
 else
  source skills/tactics.sh
  skillgain.tactics
 fi
}
