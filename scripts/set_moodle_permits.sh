#!/usr/bin/env bash

source ./.env

USER_ID=$(id -u ${USER})
GREEN=$(tput setaf 2)
RED=$(tput setaf 1)
NORMAL=$(tput sgr0)

if [[ $USER_ID = 0 ]]; then

        echo '>    start assigning permissions'
        
        chown -R root:root /var/www/html/moodle
        chmod 0755 $MOODLE_FOLDER
        find $MOODLE_FOLDER -type d -exec chmod 0755 {} \;
        find $MOODLE_FOLDER -type f -exec chmod 0644 {} \;
        
        chown -R apache:apache /var/www/html/moodledata
        chmod 0700 $MOODLEDATA_FOLDER
        find $MOODLEDATA_FOLDER -type d -exec chmod 0700 {} \;
        find $MOODLEDATA_FOLDER -type f -exec chmod 0600 {} \;

        echo ${GREEN}">    assigned moodle permissions"${NORMAL}

else
        echo ${RED}">    ERROR: you must run as sudo"${NORMAL}
fi
