#!/usr/bin/env bash

set -x
set -e
set -o pipefail

if [ "${VERSION}" == "latest" ] || [ -z "${VERSION}" ]
then
    VERSION="$(curl -s https://api.github.com/repos/cert-manager/cmctl/releases/latest | jq -r .tag_name)"
fi
ARCH=$(uname -s | tr A-Z a-z)_$(uname -m | sed 's/x86_64/amd64/')

curl -L -o cmctl https://github.com/cert-manager/cmctl/releases/download/${VERSION}/cmctl_${ARCH}
chmod +x cmctl
sudo install cmctl /usr/local/bin

cmctl completion bash > /etc/bash_completion.d/cmctl
