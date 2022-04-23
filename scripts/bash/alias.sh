#!/bin/bash

# Postgres
alias pg='psql postgresql://postgres:postgres@localhost:5433/postgres'

# Date
alias utc='date -u +"%Y-%m-%dT%H:%M:%S%Z"'

# Git
alias mas="git checkout master"
alias gcm="git commit -m "
alias gcb="git checkout "
alias ga="git add "
alias gs="git status "

# Pretty print
alias ls="lsd"
alias cat="bat"
alias df="dust"
alias py="bat -l yaml"
alias cat="bat"
alias top=bpytop

# Kubernetes
alias k="kubectl"
alias kgp="kubectl get pods"

# General
alias his="cat ~/.zsh_history"
alias in="pbcopy"
alias out="pbpaste"
alias c="code ."
