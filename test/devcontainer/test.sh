#!/usr/bin/env bash

set -x
set -e
set -o pipefail

source dev-container-features-test-lib

check "Devcontainer version" devcontainer --version

reportResults
