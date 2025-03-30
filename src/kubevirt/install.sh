#!/usr/bin/env bash

set -x
set -e
set -o pipefail

if [ "${VERSION}" == "latest" ]
then
    VERSION="$(curl -s https://api.github.com/repos/kubevirt/kubevirt/releases/latest | jq -r .tag_name)"
fi
ARCH=$(uname -s | tr A-Z a-z)-$(uname -m | sed 's/x86_64/amd64/') || windows-amd64.exe

curl -L -o virtctl https://github.com/kubevirt/kubevirt/releases/download/${VERSION}/virtctl-${VERSION}-${ARCH}
chmod +x virtctl
sudo install virtctl /usr/local/bin

virtctl completion bash > /etc/bash_completion.d/virtctl
