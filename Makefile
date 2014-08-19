.PHONY: all rhel7

all: gbalancer

GOPATH = $(PWD)/build

URL = github.com/zhgwenming
REPO = gbalancer

URLPATH = $(GOPATH)/src/$(URL)

gbalancer: engine/native/*.go
	@[ -d $(URLPATH) ] || mkdir -p $(URLPATH)
	@ln -nsf $(PWD) $(URLPATH)/$(REPO)
	GOBIN= GOPATH=$(GOPATH)	\
		go install $(URL)/$(REPO)/cmd/gbalancer $(URL)/$(REPO)/cmd/streamd
		#go build  -o $@ $(URL)/$(REPO)/cmd/gbalancer

rhel7: galerabalancer

galerabalancer: *.go
	go build -compiler gccgo -o $@

clean:
	rm -fv build/bin/*
	rm -fv lb cmd/gbalancer/gbalancer galerabalancer gbalancer
