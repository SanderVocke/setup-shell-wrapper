#!/bin/sh

readonly SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
echo "Attempting install to: /bin/wrap-shell.sh"
install -v -m755 "$SCRIPT_DIR/wrap-shell.sh" "/bin/wrap-shell.sh"
if [ "$?" != "0" ]; then
   echo "Failed, retrying with sudo"
   sudo install -v -m755 "$SCRIPT_DIR/wrap-shell.sh" "/bin/wrap-shell.sh"
fi
