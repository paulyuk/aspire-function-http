#!/bin/bash

# ========================================================================
# Installation for plow (https://github.com/six-ddc/plow):
# ========================================================================

# Use URL from environment variable if set, otherwise use command line argument, 
# or fall back to hardcoded value
URL=${DEPLOYED_URL:-${1:-"https://<your app and region>.azurecontainerapps.io"}}

echo "Running load test against: $URL/api/httppost"

plow $URL/api/httppost -c 1000 --body @singledev.json -T 'application/json' -m POST -d 5m
