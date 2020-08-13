REGISTRY_NAME?=docker.io/sbezverk
IMAGE_VERSION?=0.0.0

.PHONY: all rt-processor container push clean test

ifdef V
TESTARGS = -v -args -alsologtostderr -v 5
else
TESTARGS =
endif

all: rt-processor

rt-processor:
	mkdir -p bin
	$(MAKE) -C ./cmd compile-rt-processor

vrf-request:
	mkdir -p bin
	$(MAKE) -C ./cmd/request compile-vrf-request

container: rt-processor
	docker build -t $(REGISTRY_NAME)/rt-processor-debug:$(IMAGE_VERSION) -f ./build/Dockerfile.rt-processor .

push: container
	docker push $(REGISTRY_NAME)/rt-processor-debug:$(IMAGE_VERSION)

clean:
	rm -rf bin

test:
	GO111MODULE=on go test `go list ./... | grep -v 'vendor'` $(TESTARGS)
	GO111MODULE=on go vet `go list ./... | grep -v vendor`
