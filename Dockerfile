FROM alpine:3.10

RUN apk add curl \
    &&  $ curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh -s -- -b /usr/local/bin v0.16.0

RUN docker build -t vulnerable-image .
# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh

# Set entrypoint
ENTRYPOINT ["/entrypoint.sh"]

