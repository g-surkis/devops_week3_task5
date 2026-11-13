FROM quay.io/projectquay/golang:1.22 AS builder

ARG TARGETARCH
WORKDIR /go/src/app
COPY . .
RUN make build


FROM scratch
WORKDIR /
COPY --from=builder /go/src/app/devops_week3_task5 .
ENTRYPOINT [ "./devops_week3_task5" ]