#!/bin/sh

readonly SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
echo "Attempting install to: /tmp/bin"

mkdir -p /tmp/bin
if [ "$?" != "0" ]; then
   echo "Failed, retrying with sudo"
   sudo mkdir -p /tmp/bin
fi

install -v -m755 "$SCRIPT_DIR/wrap-shell.sh" "/tmp/bin/wrap-shell"
if [ "$?" != "0" ]; then
   echo "Failed, retrying with sudo"
   sudo install -v -m755 "$SCRIPT_DIR/wrap-shell" "/tmp/bin/wrap-shell"
fi

if [ ! -z "$INSTALL_BAT" ]; then
   install -v -m755 "$SCRIPT_DIR/wrap-shell.bat" "/bin/wrap-shell.bat"
   if [ "$?" != "0" ]; then
      echo "Failed, retrying with sudo"
      sudo install -v -m755 "$SCRIPT_DIR/wrap-shell.bat" "/bin/wrap-shell.bat"
   fi
fi

echo "/tmp/bin" >> $GITHUB_PATH
