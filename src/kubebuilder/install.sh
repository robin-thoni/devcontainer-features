#!/usr/bin/env bash

set -x
set -e
set -o pipefail

# Fail if Go is not installed
go version

curl -L -o kubebuilder "https://go.kubebuilder.io/dl/latest/$(go env GOOS)/$(go env GOARCH)"
chmod +x kubebuilder
sudo mv kubebuilder /usr/local/bin/

kubebuilder completion bash > /etc/bash_completion.d/kubebuilder
