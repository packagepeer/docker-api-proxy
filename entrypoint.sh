#!/bin/bash

set -e

source /auxiliary_functions.sh

if [ -z "$PROXY_PASS" ]; then
	log ERROR 'Missing PROXY_PASS environment variable'
	exit 1
fi

set_config '%%%PROXY_PASS%%%' "$PROXY_PASS" '/etc/nginx/sites-enabled/proxy'

exec nginx
