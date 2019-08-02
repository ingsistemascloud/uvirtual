#!/usr/bin/env bash

source ./.env

echo ">    successful deployment"
echo ">    moodle run in ${MOODLE_NETWORK}:${MOODLE_PORT}"

/usr/sbin/apachectl -DFOREGROUND
