#!/bin/sh

readonly SCRIPT_PATH=$(readlink -f "$0")
readonly SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
echo "Attempting install to: "$SCRIPT_DIR"/wrap-shell.sh"
install -Dv -m755 "$SCRIPT_DIR"/wrap-shell.sh $pwd/abin/wrap-shell.sh
echo "Result: $?"
echo "$pwd/abin" >> $GITHUB_PATH