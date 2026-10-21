#!/usr/bin/env bash

set -x
set -e
set -o pipefail

source dev-container-features-test-lib

check "kcp version" kcp --version
check "kubectl-kcp-plugin version" kubectl kcp --version
check "kubectl-kcp-plugin version" kubectl ws --version
check "kubectl-kcp-plugin version" kubectl create workspace --help

reportResults
