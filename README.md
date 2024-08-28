# GitHub Action: Setup Shell Wrapper

## Overview
This GitHub Action sets up a shell wrapper script that allows users to set the shell for actions from environment variables. It supports Windows, MacOS, and Linux, and is primarily tested for executing `bash` and `sh`.

## Files
1. `LICENSE`: GNU General Public License v3.0
2. `README.md`: Brief description and usage example of the action
3. `action.yml`: Defines the GitHub Action
4. `setup.sh`: Shell script to install the wrapper
5. `wrap-shell`: Main shell wrapper script
6. `wrap-shell.bat`: Windows batch file wrapper
7. `.github/workflows/test.yml`: Workflow for testing the action

## Usage
To use this action in your workflow:

1. Add the action to your job:
   ```yaml
   - uses: sandervocke/setup-shell-wrapper@v1
   ```

2. Use the wrapper in your steps:
   ```yaml
   - name: Run command
     shell: wrap-shell {0}
     env:
       WRAP_SHELL: bash
     run: echo 'Hello, World!'
   ```

## How it works
1. The action installs the `wrap-shell` script (and `wrap-shell.bat` for Windows) to `/tmp/bin`.
2. It adds `/tmp/bin` to the `PATH`.
3. When used, the wrapper script executes the specified command using the shell defined in the `WRAP_SHELL` environment variable.

## Testing
The action includes a comprehensive test workflow that checks functionality across various operating systems, shells, and container environments.

## License
This project is licensed under the GNU General Public License v3.0.