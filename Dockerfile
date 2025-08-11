# Step 1: Build binary
FROM golang:1.23.1-alpine AS builder
WORKDIR /app
COPY . .
RUN go mod tidy
RUN go build -o myapp .

# Step 2: Run binary in minimal image
FROM alpine:latest
WORKDIR /root/
COPY --from=builder /app/myapp .
EXPOSE 8080
CMD ["./myapp"]
