VERSION = latest
VERSION_TAG = $(VERSION)-custom

# Required variable for `make build` and `make push`
TAG_NAME = jwilder-whoami:$(VERSION_TAG)

# Change the default target from `help` to `build`
.DEFAULT_GOAL := build

include ../../docker_build.mk
include ../../help.mk

# Override `build` command to supply custom build args.
build:
	docker build . \
		--tag "$(TAG_NAME)" \
		--build-arg FROM_VERSION=$(VERSION)
