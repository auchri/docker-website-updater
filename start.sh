#!/bin/bash

[[ ! $PASSWORD ]] && PASSWORD=""

DISABLE_FUNCTIONS="passthru,system,proc_open,popen,show_source"

eval "$(ssh-agent)"
ssh-add /var/www/config/private.key

source /configure.sh
