FROM alpine:3.18

WORKDIR /pb

# Copy binary from repo
COPY pocketbase ./

# Make it executable inside container
RUN chmod +x pocketbase

# Create database folder
RUN mkdir /pb_data

EXPOSE 8090

CMD ["./pocketbase", "serve", "--dir", "/pb_data", "--http", "0.0.0.0:8090"]
