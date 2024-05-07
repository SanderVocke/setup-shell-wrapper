# GitHub Action: Setup Shell Wrapper

The `shell:` directive in GitHub Actions does not support variables.

This action works around that by creating a shell wrapper which forwards execution to a shell set in the GitHub env variables.

The action supports Windows, MacOS and Linux, but is only tested for executing `bash` and `sh`. Other shells will probably work.

## Minimal example

```yaml
runs-on: ubuntu-latest
steps:
    - uses: sandervocke/setup-shell-wrapper@v1
    - name: run command in bash
      shell: wrap-shell {0}
      env:
        WRAP_SHELL: bash
      run: echo $0   # output: "bash"
    - name: run command in sh
      shell: wrap-shell {0}
      env:
        WRAP_SHELL: sh
      run: echo $0   # output: "sh"
```
