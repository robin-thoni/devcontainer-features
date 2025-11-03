#!/usr/bin/env bash

set -x
set -e
set -o pipefail

source dev-container-features-test-lib

check "kubectl-oidc_login version" kubectl-oidc_login version

reportResults
