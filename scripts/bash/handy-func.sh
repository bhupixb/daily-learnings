#!/bin/bash

# Gives a quick summary/cheatsheet from https://cheat.sh/
function how() {
    # uncomment below line enable debugging
    # set -x

    local args=$*

    local cheat_sh_format;
    cheat_sh_format="$(echo "$args" | sed "s/ /\//g")"

    curl "cheat.sh/${cheat_sh_format}"
}
