GOPATH?=$(shell go env GOPATH)

GOPHERDOME=docker run --rm -it -e GOPHERDOME_TOKEN -v `pwd`:/gopherdome -w /gopherdome gopherdome
all: clean testimage new

clean:
	-@rm -r output
 
new:
	$(GOPHERDOME) scenarios/new/noimport.sh

.PHONY: testimage
testimage:
	docker build -t gopherdome testimage
	docker run --rm -it gopherdome

testimage-debug: testimage
	$(GOPHERDOME) bash
