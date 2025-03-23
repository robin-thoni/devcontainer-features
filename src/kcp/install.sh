#!/usr/bin/env bash

set -x
set -e
set -o pipefail

VERSION=0.27.0

cd /tmp
rm bin -rf

for archive in \
  kcp_${VERSION}_linux_amd64.tar.gz \
  kubectl-create-workspace-plugin_${VERSION}_linux_amd64.tar.gz \
  kubectl-kcp-plugin_${VERSION}_linux_amd64.tar.gz \
  kubectl-ws-plugin_${VERSION}_linux_amd64.tar.gz \
  ;
do
  wget "https://github.com/kcp-dev/kcp/releases/download/v${VERSION}/${archive}"
  tar xf ${archive}
  rm ${archive}
done

mv bin/* /usr/local/bin/

# kubectl-create-workspace does not support `completion` argument
for bin in \
  kcp \
  kubectl-kcp \
  kubectl-ws \
  ;
do
  ${bin} completion bash > /etc/bash_completion.d/${bin}
done
