FROM golang:1.22 as builder
WORKDIR /usr/src/app
COPY ./hello.go ./hello.go
RUN CGO_ENABLED=0 GOOS=linux go build -a -ldflags="-s -w" -o hello hello.go

FROM scratch
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app/hello /usr/src/app/hello
CMD [ "./hello" ]
