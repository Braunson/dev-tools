#!/bin/bash

# ONLY USED WITHIN cli.bash

if [ "$0" != "/scripts/run.bash" ]; then
    echo 'error: only run this script from within a container.'
    exit 1
fi

# maybe the user already exists, this is fine
useradd "$USER" 2> /dev/null

# execute the command passed to the container with the right user account
su "$USER" -c "$(echo "$@")"
