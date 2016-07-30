#!/bin/bash

[[ ! $PASSWORD ]] && PASSWORD=""
[[ ! $GITLAB_URL ]] && GITLAB_URL=""

DISABLE_FUNCTIONS="passthru,system,proc_open,popen,show_source"
KEY_FILE="/var/www/config/private.key"

# Add gitlab to known hosts
sudo -H -u www-data sh -c "ssh-keyscan ${GITLAB_URL} >> ~/.ssh/known_hosts"

# Add private key to ssh
chmod 600 "${KEY_FILE}"
eval "$(ssh-agent -s)"
ssh-add "${KEY_FILE}"

source /configure.sh
