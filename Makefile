build:
	CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -v -o devops_week3_task5 -ldflags "-X main.TargetArch=fakeArch"

image:
	docker build .