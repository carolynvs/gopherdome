#!/usr/bin/env bash

set -xeuo pipefail

PROJECT=github.com/carolynvs/gopherdome-user
BRANCH=master

source /scenarios/helper.sh

run-dep() {
  dep init -v
}

run-vgo() {
  vgo build
}

setup
COMMAND="run-$@"
$COMMAND
