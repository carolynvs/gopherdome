#!/usr/bin/env bash

set -xeuo pipefail

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

  if [[ -v "$PROJECT" ]]; then
    echo "PROJECT is not defined"
  fi

  if [[ -v "$BRANCH" ]]; then
    echo "BRANCH is not defined"
  fi

  GOPATH=$(go env GOPATH)
  REPO=https://$PROJECT.git
  TESTPATH=$GOPATH/src/$PROJECT
  mkdir -p $(dirname $TESTPATH)
  git clone --branch $BRANCH $REPO $TESTPATH
  cd $TESTPATH
}
