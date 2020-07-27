PWD ?= pwd_unknown
PROJECT_NAME = $(notdir $(PWD))
export PROJECT_NAME

PYTHON_VERSION=3.8
POETRY_VERSION=1.0.10
IMAGE_NAME=tolgaeren/poetry-in-a-container:${PYTHON_VERSION}-${POETRY_VERSION}
.PHONY: build
build:
	PYTHON_VERSION=${PYTHON_VERSION} POETRY_VERSION=${POETRY_VERSION} envsubst < Dockerfile.template > Dockerfile
	docker build -t ${IMAGE_NAME} .
	docker push ${IMAGE_NAME}