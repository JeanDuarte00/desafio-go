FROM golang:1.16 as BUILDER
WORKDIR /build/
COPY printer.go ./
RUN go build printer.go


FROM alpine:3.16 as WRAPPER
WORKDIR /usr/src/app
COPY --from=BUILDER /build/printer ./
CMD ["./printer"]