FROM golang:1.19 AS builder
WORKDIR /usr/src/app
COPY main.go .
RUN go build -ldflags="-s -w" main.go

FROM scratch
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app .
CMD ["./main"]