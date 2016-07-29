#!/bin/bash

[[ ! $PASSWORD ]] && PASSWORD=""

DISABLE_FUNCTIONS="passthru,system,proc_open,popen,show_source"
KEY_FILE="/var/www/config/private.key"

chmod 600 "${KEY_FILE}"
eval "$(ssh-agent)"
ssh-add "${KEY_FILE}"

source /configure.sh
