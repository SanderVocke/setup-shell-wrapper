#!/bin/sh

readonly SCRIPT_PATH=$(readlink -f "$0")
readonly SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
install -Dv -m755 "$SCRIPT_DIR"/wrap-shell.sh $pwd/abin/wrap-shell.sh
echo "$pwd/abin" >> $GITHUB_PATH