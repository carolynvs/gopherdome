GOPATH?=$(shell go env GOPATH)

SCENARIO=docker run --rm -it -e GOPHERDOME_TOKEN -v `pwd`/scenarios:/scenarios gopherdome
all: testimage new

new:
	$(SCENARIO) /scenarios/new/noimport/scenario.sh

.PHONY: testimage
testimage:
	docker build -t gopherdome testimage
	docker run --rm -it gopherdome
