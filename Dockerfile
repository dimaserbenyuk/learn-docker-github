## Go alpine image to work with
FROM golang:1.21.6-alpine3.19 as builder

WORKDIR /app

COPY go.mod main.go /app/

RUN go mod download

## We want to build our application's binary executable
RUN CGO_ENABLED=0 GOOS=linux go build -o main ./...

## the lightweight scratch image we'll
## run our application within
# FROM alpine:latest AS production
FROM gcr.io/distroless/base-debian11 as production
## We have to copy the output from our
## builder stage to our production stage
COPY --from=builder /app .

USER nonroot:nonroot
## we can then kick off our newly compiled
## binary exectuable!!
CMD ["./main"]