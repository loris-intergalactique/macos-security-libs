#!/usr/bin/env bash

#
# Lolo 2020
#
# Retrieve macOS source code from Apple sources

get_last_version() {
    # Gets the last version of a package
    # usage : get_last_version <URL> <package>
    wget "${1}" -nv -O - \
        | grep -Eo "${2}" \
        | sort -Vu \
        | tail -n 1
}

BASE_URL="https://opensource.apple.com"

SECURITY=$(get_last_version \
    "${BASE_URL}/tarballs/Security" \
    "Security-[^t]*tar.gz")

wget "${BASE_URL}/tarballs/Security/${SECURITY}" -nv -O - 
