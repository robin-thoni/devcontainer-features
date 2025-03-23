#!/usr/bin/env bash

set -x
set -e
set -o pipefail

# Only required to get GOOS and GOARCH
if ! command -v go; then
  sudo apt-get update
  sudo apt-get install -y golang
fi

curl -L -o kubebuilder "https://go.kubebuilder.io/dl/latest/$(go env GOOS)/$(go env GOARCH)"
chmod +x kubebuilder
sudo mv kubebuilder /usr/local/bin/

kubebuilder completion bash > /etc/bash_completion.d/kubebuilder
