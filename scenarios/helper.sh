#!/usr/bin/env bash

set -xeuo pipefail

if [[ -v "$PROJECT" ]]; then
  echo "PROJECT is not defined"
fi

if [[ -v "$BRANCH" ]]; then
  echo "BRANCH is not defined"
fi

SCENARIO=${SCENARIO_PATH/.sh/}
OUTPUT_DIR=${SCENARIO/scenarios/output}
GOPATH=`go env GOPATH`
REPO=https://$PROJECT.git
export TEST_DIR=$GOPATH/src/$PROJECT

configure-github-token() {
  set +x # Do not accidentally print the token
  if [[ -v GOPHERDOME_TOKEN && ! -f $HOME/.netrc ]]; then
    echo "Initializing $HOME/.netrc with GOPHERDOME_TOKEN"
    echo "machine api.github.com login GOPHERDOME password $GOPHERDOME_TOKEN" > $HOME/.netrc
  fi
  set -x
}

setup() {
  configure-github-token

  mkdir -p `dirname $TEST_DIR`
  git clone --branch $BRANCH $REPO $TEST_DIR
  cd $TEST_DIR

  mkdir -p $OUTPUT_DIR
}

reset() {
  cd $TEST_DIR
  git clean -xdf
}
