FROM golang:1.21.5-alpine3.18 as builder
WORKDIR /app
COPY . /app
RUN go mod download && go build -o /main ./src/main/

FROM scratch
WORKDIR /app
COPY --from=builder main /bin/main
EXPOSE 8080
ENTRYPOINT ["/bin/main"]
