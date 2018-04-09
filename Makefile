GOPATH?=$(shell go env GOPATH)
GITHUB_TOKEN=$(GOPHERDOME_TOKEN) # This will clobber your api rate limit, don't use your personal token

SCENARIO=docker run --rm -it -e GITHUB_TOKEN -v `pwd`/scenarios:/scenarios gopherdome
all: testimage new

new:
	$(SCENARIO) /scenarios/new/noimport/scenario.sh dep
	$(SCENARIO) /scenarios/new/noimport/scenario.sh vgo

.PHONY: testimage
testimage:
	docker build -t gopherdome testimage
	docker run --rm -it gopherdome
