#!/bin/sh

readonly SCRIPT_PATH=$(readlink "$0")
readonly SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
echo "Attempting install to: /tmp/abin/wrap-shell.sh"
mkdir -p "/tmp/abin"
install -v -m755 "$SCRIPT_DIR/wrap-shell.sh" "/tmp/abin/wrap-shell.sh"
if [ "$?" != "0" ]; then
   echo "Failed, retrying with sudo"
   sudo install -v -m755 "$SCRIPT_DIR/wrap-shell.sh" "/tmp/abin/wrap-shell.sh"
fi
echo "/tmp/abin" >> $GITHUB_PATH
