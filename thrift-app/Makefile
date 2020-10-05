REPO ?= tong16/thrift-example
VERSION ?= v0.0.1
IMAGE=$(REPO):$(VERSION)

default: all

generate:
	docker run --rm -v `pwd`:/data -it thrift thrift --gen go  -r -o /data  /data/user.thrift
	docker run --rm -v `pwd`:/data -it thrift thrift --gen go  -r -o /data  /data/server.thrift

image:
	docker build -t $(IMAGE) .

push:
	docker push $(IMAGE)

all: image push