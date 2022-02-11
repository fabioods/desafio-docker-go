FROM golang:1.17-alpine as builder
WORKDIR /usr/src/app
COPY . .
RUN go build 
CMD ["./codeeducation"]

FROM scratch
COPY --from=builder /usr/src/app/codeeducation /usr/src/app/codeeducation
ENTRYPOINT ["/usr/src/app/codeeducation"]