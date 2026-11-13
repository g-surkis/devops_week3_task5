FROM --platform=$BUILDPLATFORM quay.io/projectquay/golang:1.22 AS builder
ARG TARGETARCH
ARG TARGETOS

RUN echo "I am running on $BUILDPLATFORM, building for $TARGETARCH" > /log

WORKDIR /go/src/app
COPY . .
RUN make build ARCH=${TARGETOS}/${TARGETARCH}


FROM scratch
WORKDIR /
COPY --from=builder /go/src/app/devops_week3_task5 .
ENTRYPOINT [ "./devops_week3_task5" ]