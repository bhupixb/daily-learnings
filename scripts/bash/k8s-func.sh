#!/bin/bash

# enable/disable debug mode
# set -x

# colors
yellow='\033[0;33m'
green='\033[0;32m'
NC='\033[0m' # No Color

# change namespace
# :arg namespace
function ns() {
    if [ $# -eq 0 ];
    then
      echo "${yellow}[INFO] ${green}$(kubectl config view --minify | grep namespace)${NC}${NC}"
    else
      kubectl config set-context --current --namespace="$1"
      echo "${yellow}[INFO] switching to namespace: ${green}${1}${NC}${NC}"
    fi
}

# list all pods
function pods() {
    kubectl get pod "$@"
}

# list all deployments
function deploy() {
    kubectl get deploy "$@"
}

# describe a k8s object
function des() {
    kubectl describe "$@"
}

# print logs of a pod/service etc
function klogs() {
    kubectl logs "$@"
}

# Memory/CPU usage of a pod(s)
function usage() {
    echo "$@"
    kubectl top pod "${@}"
}

# Switch to a k8s cluster context
function useContext() {
    local context=${1}
    echo "${yellow}[INFO] switching to context: ${green}${context}${NC}${NC}"
    kubectl config use-context "${context}"
}

# Print container name & image of a given pod
function podContainers() {
    kubectl get pod "$@" --output=json | jq '.spec.containers[] | .name + "   " + .image'
}

# Print container name & image of Deployment
function depContainers() {
    kubectl get deploy "$@" --output=json | jq '.spec.template.spec.containers[] | .name + " " + .image'
}
