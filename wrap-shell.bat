echo "Running in shell %WRAP_SHELL%: %*"
setx __RUNNING_SHELL "%WRAP_SHELL%"
%WRAP_SHELL% %*