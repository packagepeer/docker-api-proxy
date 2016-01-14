#!/bin/bash

sed_escape() {
	echo "$@" | sed 's/[\/&]/\\&/g'
}

set_config() {
	REGEXP="${1}"
	REPLACEMENT="${2}"
	REPLACEMENT_SCAPED=$(sed_escape "$REPLACEMENT")
	FILE="${3}"
	sed -i "s/$REGEXP/$REPLACEMENT_SCAPED/" "$FILE"
}

log() {
    LEVEL="${1}"
    MESSAGE="${2}"
    TIMESTAMP=$(date +%Y-%m-%d:%H:%M:%S.%N)
	echo -e >&2 "[${LEVEL}]\t${TIMESTAMP}\t${MESSAGE}"
}

sudorun() {
	sudo bash -c "$1"
}

