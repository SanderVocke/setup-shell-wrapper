#!/bin/sh

readonly SCRIPT_PATH=$(readlink "$0")
readonly SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
echo "Attempting install to: "$pwd/abin/wrap-shell.sh"
mkdir -p "$pwd/abin"
install -v -m755 "$SCRIPT_DIR"wrap-shell.sh" "$pwd/abin/wrap-shell.sh"
if [ "$?" != "0" ]; then
   echo "Failed, retrying with sudo"
   sudo install -v -m755 "$SCRIPT_DIR"wrap-shell.sh" "$pwd/abin/wrap-shell.sh"
fi
echo "$pwd/abin" >> $GITHUB_PATH
