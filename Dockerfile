FROM alpine:3.18

WORKDIR /pb

# Copy binary from repo
COPY pocketbase ./

# Create database folder
RUN mkdir /pb_data

# Expose default PocketBase port
EXPOSE 8090

# Start PocketBase
CMD ["./pocketbase", "serve", "--dir", "/pb_data", "--http", "0.0.0.0:8090"]
