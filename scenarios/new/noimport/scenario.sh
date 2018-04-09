#!/usr/bin/env bash

set -xeuo pipefail

SCENARIO=${BASH_SOURCE[0]}
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

run-dep 2>&1 | tee $OUTPUT_DIR/dep.log
cp Gopkg.* $OUTPUT_DIR/

reset

run-vgo 2>&1 | tee $OUTPUT_DIR/vgo.log
cp go.mod $OUTPUT_DIR/
