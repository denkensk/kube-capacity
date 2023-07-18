#COMMONENVVAR=GOOS=linux,$(shell uname -s | tr A-Z a-z) GOARCH=$(subst x86_64,amd64,darwin,$(patsubst i%86,386,$(shell uname -m)))
#BUILDENVVAR=CGO_ENABLED=0

.PHONY: all
all: clean build

.PHONY: build
build:
	GOOS=linux GOARCH=amd64 go build -ldflags '-w' -o bin/kube-capacity cmd/main.go

#.PHONY: fixcodec
#	hack/fix-codec-factory.sh

#.PHONY: update-vendor
#update-vendor:
#	hack/update-vendor.sh

#.PHONY: unit-test
#unit-test: fixcodec update-vendor
#	hack/unit-test.sh

.PHONY: clean
clean:
	rm -rf ./bin
