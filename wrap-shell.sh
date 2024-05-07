#!/bin/sh

# Run the command/script
echo "Running in shell $WRAP_SHELL: $cmd"
export __RUNNING_SHELL=$WRAP_SHELL
$WRAP_SHELL $@