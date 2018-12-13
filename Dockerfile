FROM golang:alpine AS builder
WORKDIR /app
ENV SRC_DIR=/go/src/github.com/treeder/dockergo/
ADD . $SRC_DIR
RUN cd $SRC_DIR; go build -o myapp; cp myapp /app/

FROM alpine
WORKDIR /app
COPY --from=builder /app/ /app/

CMD ["./myapp"]
