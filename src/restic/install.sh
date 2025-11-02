#!/usr/bin/env bash

set -x
set -e
set -o pipefail

if [ "${VERSION}" == "latest" ] || [ -z "${VERSION}" ]
then
    VERSION="$(curl -s https://api.github.com/repos/restic/restic/releases/latest | jq -r .tag_name)"
fi
ARCH=$(uname -s | tr A-Z a-z)_$(uname -m | sed 's/x86_64/amd64/')
VERSION_NOV="${VERSION#v}"

curl -L -o restic.bz2 https://github.com/restic/restic/releases/download/${VERSION}/restic_${VERSION_NOV}_${ARCH}.bz2
bzip2 -d restic.bz2
chmod +x restic
sudo install restic /usr/local/bin

sudo restic generate --bash-completion /etc/bash_completion.d/restic
