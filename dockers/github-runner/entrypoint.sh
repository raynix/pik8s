#!/bin/bash

set -euo pipefail

./config.sh --url $GITHUB_URL --token $GITHUB_TOKEN
./run.sh
