FROM ubuntu:20.04

# Install Ansible Lint
# Source: https://github.com/ansible/ansible-lint
# Usage: https://ansible-lint.readthedocs.io/usage/
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y python3 \
    python3-pip

# Install Ansible
RUN apt-get install -y ansible
RUN pip3 install ansible-lint

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]

