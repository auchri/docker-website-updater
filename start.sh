#!/bin/bash

[[ ! $PASSWORD ]] && PASSWORD=""

DISABLE_FUNCTIONS="passthru,system,proc_open,popen,show_source"

source /configure.sh
