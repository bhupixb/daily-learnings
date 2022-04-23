#!/bin/bash

# Gives a quick summary/cheatsheet from https://cheat.sh/
function how() {
    # uncomment below line enable debugging
    # set -x

    local tool=$1
    local query=${@:2}

    local cheat_sh_format;
    cheat_sh_format="$(echo "$query" | sed "s/ /+/g")"

    curl "cheat.sh/${tool}/${cheat_sh_format}"
}
