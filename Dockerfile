FROM golang:1.16 as BUILDER
WORKDIR /build/
COPY printer.go ./
RUN go build -ldflags "-s -w" printer.go
CMD ["ls -al"]

FROM scratch
WORKDIR /usr/src/app
COPY --from=BUILDER /build/printer ./
CMD ["./printer"]