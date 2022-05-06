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

# Print current time in IST, UTC, unix timestamp
function now () {
	local yellow='\033[0;33m'
	local green='\033[0;32m'
	local NC='\033[0m'
	echo "${yellow}IST: ${green}$(date)${NC}${NC}"
	echo "${yellow}UTC: ${green}$(date -u)${NC}${NC}"
	echo "${yellow}UTC ISO: ${green}$(date -u +"%Y-%m-%dT%H:%M:%SZ")${NC}${NC}"
	echo "${yellow}UNIX: ${green}$(date +%s)${NC}${NC}"
}
