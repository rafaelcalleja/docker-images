VERSION ?= $(shell cat VERSION)
NEXT_RELEASE ?= $(shell docker run --rm alpine/semver semver -c -i patch $(VERSION))

IMG_REPO ?= rafaelcalleja
IMG_TAG ?= $(VERSION)
BASE_IMAGE ?= kind-cluster-jx

image: patch-version
	docker build -t $(IMG_REPO)/$(BASE_IMAGE):$(IMG_TAG) -f Dockerfile .

push:
	docker push $(IMG_REPO)/$(BASE_IMAGE):$(IMG_TAG)

patch-version:
	@echo $(NEXT_RELEASE) > VERSION

