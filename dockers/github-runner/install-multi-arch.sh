#!/bin/bash

set -euo pipefail

MACHINE=$(uname -m)
case $MACHINE in
  x86_64) ARCH=x64 ;;
  armv7*) ARCH=arm ;;
  aarch64) ARCH=arm64 ;;
esac

curl -o runner.tar.gz -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-${ARCH}-${RUNNER_VERSION}.tar.gz && \
  tar xzf runner.tar.gz && \
  rm -rf runner.tar.gz

