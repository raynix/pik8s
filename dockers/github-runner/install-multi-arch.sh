#!/bin/bash

set -euo pipefail

MACHINE=$(uname -m)

# install github-runner
case $MACHINE in
  x86_64) ARCH=x64 ;;
  armv7*) ARCH=arm ;;
  aarch64) ARCH=arm64 ;;
esac

curl -o runner.tar.gz -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-${ARCH}-${RUNNER_VERSION}.tar.gz && \
  tar xzf runner.tar.gz && \
  rm -rf runner.tar.gz

# install tk
case $MACHINE in
  x86_64) ARCH=amd64 ;;
  armv7*) ARCH=arm ;;
  aarch64) ARCH=arm64 ;;
esac

curl -fSL -o /usr/local/bin/tk "https://github.com/grafana/tanka/releases/download/v${TK_VERSION}/tk-linux-${ARCH}"
chmod a+x /usr/local/bin/tk

# install kubectl
curl -L -o /usr/local/bin/kubectl "https://dl.k8s.io/release/v${KUBECTL_VERSION}/bin/linux/${ARCH}/kubectl"
chmod a+x /usr/local/bin/kubectl
