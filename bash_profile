#!/bin/bash

# Source the files in the bash folder
source ~/.bash/shell
source ~/.bash/commands
source ~/.bash/prompt
source ~/.bash/aliases
source ~/.bash/completion/git-completion.bash

# Ruby RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

test -r /sw/bin/init.sh && . /sw/bin/init.sh

export ORACLE_HOME=/usr/local/instantclient
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/instantclient

export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/dieterprovoost/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
