#!/usr/bin/env bash

set -xeuo pipefail

if [[ ! -z "${GITHUB_TOKEN:=}" && ! -f $HOME/.netrc ]]; then
  echo "Initializing $HOME/.netrc with GITHUB_TOKEN"
  echo "machine api.github.com login GOPHERDOME password $GITHUB_TOKEN" > $HOME/.netrc
fi

setup() {
  if [[ -z "$PROJECT" ]]; then
    echo "PROJECT is not defined"
  fi

  if [[ -z "$BRANCH" ]]; then
    echo "BRANCH is not defined"
  fi

  GOPATH=$(go env GOPATH)
  REPO=https://$PROJECT.git
  TESTPATH=$GOPATH/src/$PROJECT
  mkdir -p $(dirname $TESTPATH)
  git clone --branch $BRANCH $REPO $TESTPATH
  cd $TESTPATH
}
