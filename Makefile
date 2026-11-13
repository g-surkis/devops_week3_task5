CPU ?= amd64
ARCH ?= linux/$(shell go env GOARCH)
TARGETOS   := $(word 1,$(subst /, ,$(ARCH)))
TARGETARCH := $(word 2,$(subst /, ,$(ARCH)))
EXT := $(if $(filter windows,$(TARGETOS)),.exe,)

build:
	CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -v -o devops_week3_task5${EXT} -ldflags "-X main.TargetArch=${TARGETOS}/${TARGETARCH}"

image:
	docker build . --platform=${ARCH}

linux:
	make build ARCH=linux/$(CPU)

windows:
	make build ARCH=windows/$(CPU)

macos:
	make build ARCH=darwin/$(CPU)