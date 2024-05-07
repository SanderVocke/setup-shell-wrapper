#!/bin/sh

readonly SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
echo "Attempting install to: /tmp/bin"

install -v -m755 "$SCRIPT_DIR/wrap-shell.sh" "/tmp/bin/wrap-shell.sh"
if [ "$?" != "0" ]; then
   echo "Failed, retrying with sudo"
   sudo install -v -m755 "$SCRIPT_DIR/wrap-shell.sh" "/tmp/bin/wrap-shell.sh"
fi

install -v -m755 "$SCRIPT_DIR/wrap-shell.sh.bat" "/tmp/bin/wrap-shell.sh.bat"
if [ "$?" != "0" ]; then
   echo "Failed, retrying with sudo"
   sudo install -v -m755 "$SCRIPT_DIR/wrap-shell.sh.bat" "/tmp/bin/wrap-shell.sh.bat"
fi

echo "/tmp/bin" >> $GITHUB_PATH
