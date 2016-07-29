#!/bin/bash

[[ ! $PASSWORD ]] && PASSWORD=""

DISABLE_FUNCTIONS="passthru,system,proc_open,popen,show_source"

ssh-agent /bin/bash
ssh-add /var/www/config/private.key

source /configure.sh
