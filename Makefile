ARCH ?= linux/arm64
TARGETOS   := $(word 1,$(subst /, ,$(ARCH)))
TARGETARCH := $(word 2,$(subst /, ,$(ARCH)))
EXT := $(if $(filter windows,$(TARGETOS)),.exe,)

build:
	CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -v -o devops_week3_task5${EXT} -ldflags "-X main.TargetArch=${TARGETOS}/${TARGETARCH}"

image:
	docker build .