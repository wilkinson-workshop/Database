#!/bin/bash
# Adds a user to the database server.

set -eu -o pipefail

if [[ $# < 1 ]]; then
    echo "error: expected at least 1 argument."
    exit 1
fi
