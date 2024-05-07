# GitHub Action: Setup Shell Wrapper

The `shell:` directive in GitHub Actions does not support variables.

This action works around that by creating a shell wrapper which forwards execution to a shell set in the GitHub env variables.

## Minimal example

```yaml
runs-on: ubuntu-latest
steps:
    - uses: sandervocke/setup-shell-wrapper@v1
    - name: run command in bash
      shell: sh wrap-shell.sh {0}
      env:
        WRAP_SHELL: bash
      run: echo $0   # output: "bash"
    - name: run command in sh
      shell: sh wrap-shell.sh {0}
      env:
        WRAP_SHELL: sh
      run: echo $0   # output: "sh"
```
