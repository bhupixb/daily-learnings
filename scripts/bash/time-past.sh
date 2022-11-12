#!/bin/bash

# Print date in local, UTC and unixtimestamp format
# Tested on OSX

# Usage: bash <file> [1d, 2M, 3H]
# Print time 1 day or 2 minutes or 3Hrs ago

function now2() {
    local yellow='\033[0;33m'
    local green='\033[0;32m'
    local NC='\033[0m' # No Color
    local ago="${1:-"0m"}"
    # # Print date with give interval substracted
    echo ""
    echo "Zone=> Date"
    echo "${yellow}IST(Local)=> ${green}$(date -j -v-${ago})${NC}${NC}"
    echo "${yellow}UTC=> ${green}$(date -j -v-${ago} -u)${NC}${NC}"
    echo "${yellow}UTC Date/time=> ${green}$(date -j -v-${ago} -u +'%Y-%m-%dT%H:%M:%SZ')${NC}${NC}"
    echo "${yellow}Unix Date/time=> ${green}$(date -j -v-${ago} +%s)${NC}${NC}"
}

function now() {
    now2 "$1" | column -t -s "=>"
}
