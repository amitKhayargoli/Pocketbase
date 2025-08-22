# Use a lightweight Linux image
FROM alpine:3.18

WORKDIR /pb

# Download PocketBase
ADD https://github.com/pocketbase/pocketbase/releases/download/v0.29.2/pocketbase_0.29.2_linux_amd64.zip pb.zip

# Install unzip, unzip the binary, and remove zip
RUN apk add --no-cache unzip \
    && unzip pb.zip \
    && rm pb.zip

# Create a folder for the database
RUN mkdir /pb_data

# Expose default PocketBase port
EXPOSE 8090

# Start PocketBase
CMD ["./pocketbase", "serve", "--dir", "/pb_data", "--http", "0.0.0.0:8090"]
