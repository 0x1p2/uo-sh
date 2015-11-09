#!/bin/bash

function miscskillgain {
 if [[ $item_weapon_class == "magery" ]]; then
  source skills/meditation.sh
  skillgain.meditation
 else
  source skills/focus.sh
  skillgain.focus
 fi
}
