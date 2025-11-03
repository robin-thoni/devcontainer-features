#!/usr/bin/env bash

set -x
set -e
set -o pipefail

if [ "${VERSION}" == "latest" ] || [ -z "${VERSION}" ]
then
    VERSION="$(curl -s https://api.github.com/repos/int128/kubelogin/releases/latest | jq -r .tag_name)"
fi
ARCH=$(uname -s | tr A-Z a-z)_$(uname -m | sed 's/x86_64/amd64/')

curl -L -o kubelogin.zip https://github.com/int128/kubelogin/releases/download/${VERSION}/kubelogin_${ARCH}.zip
unzip kubelogin.zip
chmod +x kubelogin
sudo install kubelogin /usr/local/bin/kubectl-oidc_login
rm -rf kubelogin.zip LICENSE README.md kubelogin
