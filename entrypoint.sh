#!/bin/bash

COLLECTIONS_ARRAY=($COLLECTIONS)

if [ -z $COLLECTIONS_ARRAY ]; then
    ansible-lint --nocolor $@
else
    for collection in ${COLLECTIONS_ARRAY[@]}; do
        ansible-galaxy collection install $collection
    done
    ansible-lint --nocolor $@
fi

