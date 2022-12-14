# ansible-lint
This action runs a linter for Ansible Playbooks. Multiple additional arguments can be issued using `args` in the action

# Usage
See [ansible-lint.yml](.github/workflows/ansible-lint.yml)

```yaml
on: push
name: Ansible Lint
jobs:
  linter:
    name: Lint Ansible Playbooks
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v3

      - name: Linter
        uses: kapost/ansible-lint@v1
        env:
          COLLECTIONS: community.general ansible.posix ansible.network # <-- Optional to install additional collections for linting
```

Example arguments issued under `args` in the action

```yaml
on: push
name: Ansible Lint
jobs:
  linter:
    name: Lint Ansible Playbooks
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v3

      - name: Linter
        uses: kapost/ansible-lint@v1
        env:
          COLLECTIONS: community.general ansible.posix ansible.network # <-- Optional to install additional collections for linting
        with:
          args: |
            -v --config-file .config/my-custom-config.yml --warn-list fqcn[redirect]
```

## Variables
`COLLECTIONS` - **not required**: This allows for additional collections to be installed at run time for linting. Some collections aren't pre-installed with Ansible and may cause false flags when linting.

