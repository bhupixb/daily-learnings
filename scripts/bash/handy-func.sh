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

# Print date,time in local, UTC and unixtimestamp format
# Tested on OSX
function now() {
    # set -x
    local yellow='\033[0;33m'
    local green='\033[0;32m'
    local NC='\033[0m' # No Color
    local ago=$1
    # Print date with give interval substracted
    # one of either y, m, w, d, H, M or S must be used to specify which part of the date is to be adjusted.
    if [ ! -z $ago ]; then
        echo "in"
        echo "${yellow}IST: ${green}$(date -j -v-${ago}) ${NC}${NC}"
        echo "${yellow}UTC: ${green}$(date -j -v-${ago} -u)${NC}${NC}"
        echo "${yellow}UTC ISO: ${green}$(date -j -v-${ago} -u +"%Y-%m-%dT%H:%M:%SZ")${NC}${NC}"
        echo "${yellow}UNIX: ${green}$(date -j -v-${ago} +%s)${NC}${NC}"
    # Print current date
    else
        echo "${yellow}IST: ${green}${local_date} ${NC}${NC}"
        echo "${yellow}UTC: ${green}$(date -u)${NC}${NC}"
        echo "${yellow}UTC ISO: ${green}$(date -u +"%Y-%m-%dT%H:%M:%SZ")${NC}${NC}"
        echo "${yellow}UNIX: ${green}$(date +%s)${NC}${NC}"
    fi
}
