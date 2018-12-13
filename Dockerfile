# iron/go:dev is the alpine image with the go tools added
FROM golang:alpine AS builder
WORKDIR /app
# Set an env var that matches your github repo name, replace treeder/dockergo here with your repo name
ENV SRC_DIR=/go/src/github.com/treeder/dockergo/
# Add the source code:
ADD . $SRC_DIR
# Build it:
RUN cd $SRC_DIR; go build -o myapp; cp myapp /app/

FROM alpine
WORKDIR /app
COPY --from=builder /app/ /app/

CMD ["./myapp"]
