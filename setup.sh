#!/bin/sh

readonly SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
if [ ! -z "__SETUP_SHELL_WRAPPER_VERBOSE"]; then
  echo "setup-shell-wrapper: Attempting install to: /tmp/bin"
fi

mkdir -p /tmp/bin
if [ "$?" != "0" ]; then
   if [ ! -z "__SETUP_SHELL_WRAPPER_VERBOSE"]; then
     echo "setup-shell-wrapper: Failed to create /tmp/bin, retrying with sudo"
   fi
   sudo mkdir -p /tmp/bin
fi

install -v -m755 "$SCRIPT_DIR/wrap-shell" "/tmp/bin/wrap-shell"
if [ "$?" != "0" ]; then
   if [ ! -z "__SETUP_SHELL_WRAPPER_VERBOSE"]; then
     echo "setup-shell-wrapper: Failed to install wrap-shell, retrying with sudo"
   fi
   sudo install -v -m755 "$SCRIPT_DIR/wrap-shell" "/tmp/bin/wrap-shell"
fi

if [ ! -z "$INSTALL_BAT" ]; then
   install -v -m755 "$SCRIPT_DIR/wrap-shell.bat" "/bin/wrap-shell.bat"
   if [ "$?" != "0" ]; then
      if [ ! -z "__SETUP_SHELL_WRAPPER_VERBOSE"]; then
        echo "setup-shell-wrapper: Failed to install wrap-shell.bat, retrying with sudo"
      fi
      sudo install -v -m755 "$SCRIPT_DIR/wrap-shell.bat" "/bin/wrap-shell.bat"
   fi
fi

echo "/tmp/bin" | tee -a $GITHUB_PATH
