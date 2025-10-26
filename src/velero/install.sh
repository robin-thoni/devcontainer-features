#!/usr/bin/env bash

set -x
set -e
set -o pipefail

if [ "${VERSION}" == "latest" ] || [ -z "${VERSION}" ]
then
    VERSION="$(curl -s https://api.github.com/repos/vmware-tanzu/velero/releases/latest | jq -r .tag_name)"
fi
ARCH=$(uname -s | tr A-Z a-z)-$(uname -m | sed 's/x86_64/amd64/')

curl -L -o velero.tar.gz https://github.com/vmware-tanzu/velero/releases/download/${VERSION}/velero-${VERSION}-${ARCH}.tar.gz
tar -xzf velero.tar.gz
chmod +x velero-${VERSION}-${ARCH}/velero
sudo install velero-${VERSION}-${ARCH}/velero /usr/local/bin
rm -rf velero.tar.gz velero-${VERSION}-${ARCH}

velero completion bash > /etc/bash_completion.d/velero
