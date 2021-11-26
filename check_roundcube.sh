#!/bin/bash
#
# dependencies:
# * php
# * php-cli
# * php-curl

# Get into the correct dir
FULLPATH_OF_THIS_SCRIPT=`realpath "$0"`
DIR_OF_THIS_SCRIPT=`dirname "$FULLPATH_OF_THIS_SCRIPT"`
cd "$DIR_OF_THIS_SCRIPT"

php try_to_log_in_to_roundcube.php >/dev/null

# Capture the return value.
RETURN=$?

if [ $RETURN == 0 ]
then
    echo "OK - Roundcube login works"
    exit 0
else
    echo "CRITICAL - Roundcube login failed"
    exit 2
fi

