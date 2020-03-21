#!/bin/bash

path="$1"
passfile="$PREFIX/$path.gpg"
check_sneaky_paths "$path"

if [[ -f $passfile ]]; then
    $GPG -d "${GPG_OPTS[@]}" "$passfile" | \
    while read str
    do
        str=$(echo -e "$str" | sed -e 's/#.*//' -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')
        if test -z "$str" ; then
            continue
        fi
        echo "export $str"
    done || exit $?
elif [[ -z $path ]]; then
    die ""
else
    die "Error: $path is not in the password store."
