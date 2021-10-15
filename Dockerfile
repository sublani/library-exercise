FROM golang:1.15.15-alpine3.13 AS build

# Con esto seteamos las variables de entorno. De forma resumida GOPROXY es un proxy de Google (CDN) para descargar los paquetes y lo cual nos ayudará a que estas descargas vayan más rápidas sin necesidad de vendoring
ENV GOPROXY=https://proxy.golang.org

WORKDIR /go/src/api

COPY . .

RUN GOOS=linux GOARCH=amd64 go build -o /go/bin/api cmd/geekshubs-library/main.go

FROM alpine

COPY --from=build /go/bin/api /go/bin/api

ENTRYPOINT ["go/bin/api"]