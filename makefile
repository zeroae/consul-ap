MAKEFLAGS += --warn-undefined-variables
SHELL := /bin/bash
.SHELLFLAGS := -eu -o pipefail
.DEFAULT_GOAL := build

TAG?=latest

# run the Docker build
build:
	docker build -t="zeroae/consul:${TAG}" .

# push our image to the public registry
ship:
	docker tag zeroae/consul:${TAG} zeroae/consul:latest
	docker push "zeroae/consul:${TAG}"
	docker push "zeroae/consul:latest"
