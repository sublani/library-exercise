FROM golang:latest AS build

# Con esto seteamos las variables de entorno. De forma resumida GOPROXY es un proxy de Google (CDN) para descargar los paquetes y lo cual nos ayudará a que estas descargas vayan más rápidas sin necesidad de vendoring
ENV GOPROXY=https://proxy.golang.org

WORKDIR /go/src/api

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /go/bin/api cmd/geekshubs-library/main.go

FROM alpine:latest

COPY --from=build /go/bin/api /go/bin/api

RUN chmod +x /go/bin/api

ENTRYPOINT ["go/bin/api"]